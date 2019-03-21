package com.zz624.biz;

import com.zz624.entry.User;
import java.util.List;

public interface UserBiz {
	// 登录
	User findUser(User user);

	// 查询用户
	User findOwn(User user);
	
	// 查询用户
	User findUserById(Integer userid);

	// 修改密码
	boolean modifyOwn(User user);

	// 添加用户
	boolean addUser(User user);

	// 修改用户
	boolean modifyUser(User user);

	//人脸登录
	//int findUserFace(User user);

	//人脸注册
	//int findUserFacePwd(User user);
}
