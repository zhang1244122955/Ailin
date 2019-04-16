package com.zz624.biz.impl;

import com.zz624.biz.UserBiz;
import com.zz624.dao.UserDao;
import com.zz624.entry.User;
//import com.zz624.matchbean.FMatch;
//import com.zz624.util.FaceMatch;
//import com.zz624.util.PageBean;
import com.zz624.matchbean.FMatch;
import com.zz624.util.FaceMatch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserBizImpl implements UserBiz {
    @Autowired
    private UserDao ud;

    //登录
    @Override
    public User findUser(User user) {
        return ud.selectUser(user);
    }

    //查询用户
    @Override
    public User findOwn(User user) {
        return ud.selectOwn(user);
    }

    //修改密码
    @Override
    public boolean modifyOwn(User user) {
        int i = ud.updateOwn(user);
        if (i > 0) {
            return true;
        }
        return false;
    }

    //添加用户
    @Override
    public boolean addUser(User user) {
        int i = ud.insertUser(user);
        if (i > 0) {
            return true;
        }
        return false;
    }


    //修改用户
    @Override
    public boolean modifyUser(User user) {
        int i = ud.updateUser(user);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public int addUserFace(User user) {
        //获得人脸信息
        FMatch fMatch = FaceMatch.match(user.getFacetoken());
//        System.out.println(fMatch.toString());
        switch (fMatch.getError_code()) {
            case 0:
                // 正常检测完毕
                //更新人脸信息
                user.setFacetoken(fMatch.getResult().getFace_list().get(0).getFace_token());
                FaceMatch.add(""+user.getId(),user.getFacetoken());
                //采集信息
                fMatch = FaceMatch.detect(user.getFacetoken());
                System.out.println(fMatch.toString());
                //年龄
                user.setAge(fMatch.getResult().getFace_list().get(0).getAge());
                user.setSex(fMatch.getResult().getFace_list().get(0).getGender().getType().equals("male")?0:1);
                ud.updateUser(user);

                return 10002000;//用户名脸部信息采集成功

            case 222202:
                return 10000009;//图片中没有人脸
            case 223113:
                return 10000010;//人脸有被遮挡
            case 223114:
                return 10000011;//人脸模糊
            case 223115:
                return 10000012;//人脸光照不好
            case 223116:
                return 10000013;//人脸不完整
            case 223120:
                return 10000014;//活体检测未通过
            case 223121:
                return 10000015;//质量检测未通过 右眼遮挡程度过高
            case 223122:
                return 10000016;//质量检测未通过 左眼遮挡程度过高
            case 223123:
                return 10000017;//质量检测未通过 右脸遮挡程度过高
            case 223124:
                return 10000018;//质量检测未通过 左脸遮挡程度过高
            case 223125:
                return 10000019;//质量检测未通过 下巴遮挡程度过高
            case 223126:
                return 10000020;//质量检测未通过 鼻子遮挡程度过高
            case 223127:
                return 10000021;//质量检测未通过 嘴巴遮挡程度过高
            default:
                return 10000100;//发现未知错误
        }
    }


    @Override
    public int findUserFace(User user) {

        User user1 = ud.selectUser(user);
        System.out.println(user.getFacetoken()+"---"+user1.getFacetoken());
        //获得比对结果
        FMatch fMatch = FaceMatch.match(user.getFacetoken(), user1.getFacetoken());
        System.out.println(fMatch.toString());
        //解析比对结果
        switch (fMatch.getError_code()) {
            case 0:
                // 正常比对完毕
                if (fMatch.getResult().getScore() >= 80) {
                    return 10002000;//用户名脸部信息匹配成功
                } else {
                    return 10000004;//用户名脸部信息匹配失败
                }
            case 222202:
                return 10000009;//图片中没有人脸
            case 223113:
                return 10000010;//人脸有被遮挡
            case 223114:
                return 10000011;//人脸模糊
            case 223115:
                return 10000012;//人脸光照不好
            case 223116:
                return 10000013;//人脸不完整
            case 223120:
                return 10000014;//活体检测未通过
            case 223121:
                return 10000015;//质量检测未通过 右眼遮挡程度过高
            case 223122:
                return 10000016;//质量检测未通过 左眼遮挡程度过高
            case 223123:
                return 10000017;//质量检测未通过 右脸遮挡程度过高
            case 223124:
                return 10000018;//质量检测未通过 左脸遮挡程度过高
            case 223125:
                return 10000019;//质量检测未通过 下巴遮挡程度过高
            case 223126:
                return 10000020;//质量检测未通过 鼻子遮挡程度过高
            case 223127:
                return 10000021;//质量检测未通过 嘴巴遮挡程度过高
            default:
                return 10000100;//发现未知错误
        }

    }

//	@Override
//	public int findUserFacePwd(User user) {
//		User user1 = ud.selectUserById(user.getUserid());
//		User user2 = ud.selectUser(user);
//		if (user1 == null) {
//			return 10000001;//用户名不存在
//		}else if (user2 == null) {
//			return 10000002;//密码错误
//		}else{
//			//用户名密码正确录入人脸
//			//获得人脸信息
//			FMatch fMatch = FaceMatch.match(user.getFacetoken());
//			//解析人脸结果
//
//			switch (fMatch.getError_code()) {
//			case 0:
//				// 正常检测完毕
//				//更新人脸信息
//				user2.setFacetoken(fMatch.getResult().getFace_list().get(0).getFace_token());
//				ud.updateUser(user2);
//				return 10002000;//用户名脸部信息匹配成功，允许登录
//
//			case 223113:
//				return 10000010;//人脸有被遮挡
//			case 223114:
//				return 10000011;//人脸模糊
//			case 223115:
//				return 10000012;//人脸光照不好
//			case 223116:
//				return 10000013;//人脸不完整
//			case 223120:
//				return 10000014;//活体检测未通过
//			case 223121:
//				return 10000015;//质量检测未通过 右眼遮挡程度过高
//			case 223122:
//				return 10000016;//质量检测未通过 左眼遮挡程度过高
//			case 223123:
//				return 10000017;//质量检测未通过 右脸遮挡程度过高
//			case 223124:
//				return 10000018;//质量检测未通过 左脸遮挡程度过高
//			case 223125:
//				return 10000019;//质量检测未通过 下巴遮挡程度过高
//			case 223126:
//				return 10000020;//质量检测未通过 鼻子遮挡程度过高
//			case 223127:
//				return 10000021;//质量检测未通过 嘴巴遮挡程度过高
//			default:
//				return 10000100;//发现未知错误
//			}
//		}
//	}

    //通过id查找User
    @Override
    public User findUserById(Integer userid) {

        return ud.selectUserById(userid);
    }
}
