package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.UserImeiDao;
import com.stomato.domain.UserImei;

@Service
public class UserImeiService {
	
	@Autowired
	private UserImeiDao userImeiDao;

	public UserImei getUserImei(UserImei userImei) {
		return userImeiDao.select(userImei);
	}
	
	public List<UserImei> getAllUserImei(UserImei userImei) {
		return userImeiDao.selectAll(userImei);
	}
	
	public int addUserImei(UserImei userImei) {
		return userImeiDao.insert(userImei);
	}
	
	public int deleteUserImei(UserImei userImei) {
		return userImeiDao.delete(userImei);
	}
	
	public int updateUserImei(UserImei userImei) {
		return userImeiDao.update(userImei);
	}
}
