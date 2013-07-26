package com.stomato.dao;

import java.util.List;

import com.stomato.domain.FormParam;
import com.stomato.domain.User;

public interface UserDao {
	
	User getUser(User user);
	
	User getUserByUid(int uid);
	
	void updateUser(User user);
	
	void addUser(User user);
	
	int updatePassword(User user);
	
	void updateLoginToken(User user);
	
	User getUserByEmail(String email);
	
	int updateEmail(User user);
	
	User verify(User user);
	
	int listTotal(FormParam param);
	
	List<User> listUser(FormParam param );
}
