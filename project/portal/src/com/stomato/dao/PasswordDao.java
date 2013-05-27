package com.stomato.dao;

import com.stomato.domain.Password;

public interface PasswordDao {
	
	Password select(String token);
	
	void insert(Password pwd);
	
	int exist(String email);
	
	void update(Password pwd);
	
	void delete(String email);
	
}
