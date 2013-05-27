package com.stomato.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.PasswordDao;
import com.stomato.domain.Password;

@Service
public class PasswordService {
	
	@Autowired
	private PasswordDao pwdDao;
	
	public void setToken(Password pwd) {
		if (pwdDao.exist(pwd.getEmail()) == 1) {
			pwdDao.update(pwd);
		} else {
			pwdDao.insert(pwd);
		}
	}
	
	public Password getToken(String token) {
		return pwdDao.select(token);
	}
	
	public void removeToken(String email) {
		pwdDao.delete(email);
	}
}
