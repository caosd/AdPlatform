package com.stomato.dao;

import com.stomato.domain.User;

public interface UserDao {
	
	User getUser(User user);
	
	void updateUser(User user);
	
	void addUser(User user);
	
	int updatePassword(User user);
	
	void updateLoginToken(User user);
	
	User getUserByEmail(String email);
	
	int updateEmail(User user);
	
	User verify(User user);
}
