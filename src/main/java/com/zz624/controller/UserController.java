package com.zz624.controller;

import com.google.gson.Gson;
import com.zz624.biz.OrderBiz;
import com.zz624.biz.ShopcarBiz;
import com.zz624.biz.UserBiz;
import com.zz624.entry.Order;
import com.zz624.entry.Shopcar;
import com.zz624.entry.User;
import com.zz624.util.CodeUtil;
import com.zz624.util.MD5util;
import com.zz624.util.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.zz624.controller.OrderController.getBeforeSevenDay;

//用户控制层
@Controller
public class UserController {
    @Autowired
    private UserBiz ub;
	@Autowired
	private ShopcarBiz sb;
	@Autowired
	private OrderBiz ob;

	@RequestMapping("/login")
	@ResponseBody
	public String Login(User user,String code, HttpSession session) {
		System.out.println("---登录");


		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		//判断验证码是否正确
		//if(code.equalsIgnoreCase((String)session.getAttribute("code")) && user.getPhone().equals(session.getAttribute("phone"))){
		//关闭验证码验证
		if(true){
			//验证码正确
			User own = ub.findUser(user);
			if (own != null) {
				session.setAttribute("user", own);
				//老用户直接登录
				return "001";
			}else{
				//新用户（第一次注册）

				user.setRegisterdate(sdf.format(now));
				ub.addUser(user);
				own = ub.findUser(user);
				session.setAttribute("user", own);
				return "002";
			}
		}else{
			//验证码不正确
			return "000";
		}

	}

	@RequestMapping("/setfacetoken")
	@ResponseBody
	public String setFaceToken(User user, HttpSession session) {
		System.out.println("---setFaceToken");

		User own = ub.findUser(user);

		// 切掉字符串没用部分
		own.setFacetoken(user.getFacetoken().substring(22));
		//开通人脸识别
		int code = ub.addUserFace(own);

		return ""+code;

	}

	@RequestMapping("/sendmessage")
	@ResponseBody
	public void sendMessage(String phone, HttpSession session) {
		System.out.println("---发送验证码");
		//获取验证码
		String code = CodeUtil.getCode();

		MessageUtils.send(phone,code);

		session.setAttribute("code",code);
		session.setAttribute("phone",phone);


	}



	
	@RequestMapping("/facematch")
	@ResponseBody
	public String faceMatch(User user,String ids,String money,HttpSession session) {
		System.out.println("---faceMatch");

		// 切掉字符串没用部分
		user.setFacetoken(user.getFacetoken().substring(22));

		//开通人脸识别
		int code = ub.findUserFace(user);
		if(10002000 == code){
			User own = ub.findUser(user);
			double balance = own.getBalance()-Double.parseDouble(money);
			if(balance >= 0){
				own.setBalance(balance);
				//先扣钱
				ub.modifyUser(own);
				//修改购物车物品的状态
				sb.modifyFlagByIds(ids);
				//添加订单信息
				Order order;
				Date now = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				DateFormat d2 = DateFormat.getTimeInstance();
				List<Shopcar> shopcarList = sb.findShopcarByUserIds(ids);
				for (int i = 0;i < shopcarList.size();i++){
					order = new Order();
					order.setAge(own.getAge());
					order.setSex(own.getSex());
					order.setColor(shopcarList.get(i).getColor());
					order.setGoodsid(shopcarList.get(i).getGoodsid());
					order.setUserid(shopcarList.get(i).getUserid());
					order.setGoodsname(shopcarList.get(i).getGoodsname());
					order.setNumber(shopcarList.get(i).getNumber());
					order.setPrice(shopcarList.get(i).getPrice());
					order.setSumprice(shopcarList.get(i).getNumber()*shopcarList.get(i).getPrice());
					order.setPaydate(sdf.format(now));
					order.setPaytime(d2.format(now));
					order.setCategory(shopcarList.get(i).getCategory());

					ob.addOrder(order);

				}
				return code + ","+balance;
			}else{
				//余额不足
				code = 10000005;
			}
		    //
        }


		return ""+code;
	}

    @RequestMapping("/getSevenUsers")
    @ResponseBody
    public String getSevenUsers(HttpSession session) {
        System.out.println("---getSevenUsers");

        Map map = new HashMap();

        String[] days = getBeforeSevenDay();
        String[] vals = new String[7];

        for(int i = 0;i<7;i++){
            vals[i] = ""+ub.findSumUsersByDates(days[i]);
        }

        map.put("key",days);
        map.put("value",vals);

        Gson gson = new Gson();
        String json = gson.toJson(map);
        System.out.println("json"+json);
        return json;

    }

}
