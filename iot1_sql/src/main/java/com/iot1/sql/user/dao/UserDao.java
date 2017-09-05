package com.iot1.sql.user.dao;

import java.util.List;
import java.util.Map;

import com.iot1.sql.user.dao.dto.UserInfo;

public interface UserDao {

	public UserInfo selectUser(UserInfo user);

	public List<UserInfo> selectUserList(UserInfo user);
	
	public int insertUser(UserInfo user);
	
	public int deletetUser(UserInfo user);
	
	public int updateUser(UserInfo user);

}
