package com.zz624.dao;

import com.zz624.entry.User;


public interface UserDao {
	// 登录
	User selectUser(User user);
	
	// 人脸登录
	//User selectUserFace(User user);

	// 查询用户
	User selectOwn(User user);
	
	// 查询用户
	User selectUserById(Integer userid);

	// 修改密码
	int updateOwn(User user);

	// 添加用户
	int insertUser(User user);

	// 修改用户
	int updateUser(User user);

}
