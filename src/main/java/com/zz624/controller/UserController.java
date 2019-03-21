package com.zz624.controller;

import com.zz624.biz.UserBiz;
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
import java.util.List;

//用户控制层
@Controller
public class UserController {
	@Autowired
	private UserBiz ub;

	@RequestMapping("/login")
	@ResponseBody
	public String Login(User user,String code, HttpSession session) {
		System.out.println("---登录");

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
				ub.addUser(user);
				return "002";
			}
		}else{
			//验证码不正确
			return "000";
		}

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

//	@RequestMapping("/modifyOwn")
//	public String modifyOwn(User user, HttpServletRequest request) {
//		System.out.println("---修改密码");
//		//对密码进行加密
//		user.setUserpwd(MD5util.getPwd(user.getUserpwd()));
//		boolean b = ub.modifyOwn(user);
//		if (b) {
//			return "redirect:login.jsp";
//		}
//		return "redirect:login.jsp";
//	}
//
//	@RequestMapping("/addUser")
//	public String addUser(User user, Role role, HttpServletRequest request) {
//		System.out.println("---添加用户");
//		user.setRole(role);
//		//对密码进行加密
//		user.setUserpwd(MD5util.getPwd(user.getUserpwd()));
//		boolean b = ub.addUser(user);
//		if (b) {
//			return "redirect:findUsers";
//		}
//		return "redirect:findUsers";
//	}
//
//
//
//	@RequestMapping("/modifyUser")
//	public String modifyUser(User user, Role role, HttpServletRequest request) {
//		System.out.println("---修改用户");
//		user.setRole(role);
//		boolean b = ub.modifyUser(user);
//		if (b) {
//			return "redirect:findUsers";
//		}
//		return "redirect:findUsers";
//	}
//
//	@RequestMapping("/findUser")
//	public String findOwn(User user, HttpServletRequest request) {
//		System.out.println("---查询用户");
//		User own = ub.findOwn(user);
//		List<Role> roles = rb.findRoles();
//		if (own != null) {
//			request.setAttribute("u", own);
//			request.setAttribute("roles", roles);
//			return "user-modify";
//		}
//		return "user-list";
//	}


	
//	@RequestMapping("/facelogin")
//	@ResponseBody
//	public String faceLogin(User user, HttpSession session) {
//		System.out.println("---人脸登录");
//
//
//		// 切掉字符串没用部分
//		user.setFacetoken(user.getFacetoken().substring(22));
//
//		int code = 0;
//
//		if("".equals(user.getUserpwd())){
//			//调用人脸登录方法获得结果
//			code = ub.findUserFace(user);
//		}else{
//			//通过密码开通人脸识别
//			//对密码进行加密
//			user.setUserpwd(MD5util.getPwd(user.getUserpwd()));
//			code = ub.findUserFacePwd(user);
//		}
//
//		if(code == 10002000){
//			//如果成功登陆，就把用户名存入session
//			User own = ub.findUserById(user.getUserid());
//			Role role = rb.findRole(own.getRole().getRoleid());
//			session.setAttribute("user", own);
//			session.setAttribute("role", role);
//		}
//		return ""+code;
//	}
}
