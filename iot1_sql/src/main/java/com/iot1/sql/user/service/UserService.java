package com.iot1.sql.user.service;

import java.util.List;
import java.util.Map;

import com.iot1.sql.user.dao.dto.UserInfo;

public interface UserService {
	public UserInfo login(UserInfo user);

	public UserInfo selectUser(UserInfo user);

	public List<UserInfo> selectUserList(UserInfo user);
	
	public int insertUser(UserInfo user);
	
	public int updatetUser(UserInfo user);
	
	public int deleteUser(UserInfo user);
}
