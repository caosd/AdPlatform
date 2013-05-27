package com.stomato.dao;

import java.util.List;

import com.stomato.domain.UserImei;

public interface UserImeiDao {
	
	UserImei select(UserImei userImei);
	
	List<UserImei> selectAll(UserImei userImei);
	
	int delete(UserImei userImei);
	
	int insert(UserImei userImei);
	
	int update(UserImei userImei);
}
