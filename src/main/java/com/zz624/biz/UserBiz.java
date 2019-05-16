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
	int addUserFace(User user);

	//人脸比较
	int findUserFace(User user);

	//获取某天总用户数
	int findSumUsersByDates(String date);
}
