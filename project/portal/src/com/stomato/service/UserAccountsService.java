package com.stomato.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.UserAccountDao;
import com.stomato.domain.User;
import com.stomato.domain.UserAccount;

@Service
public class UserAccountsService {
	
	@Autowired
	private UserAccountDao accountDao;
	
	public UserAccount getUserAccount(UserAccount userAccount){
		return accountDao.getUserAccount(userAccount);
	}
	
	public UserAccount getUserAccountByUser(User user){
		return accountDao.getUserAccountByUser(user);
	}
	
	public UserAccount getUserAccountByUid(int uid){
		User user = new User();
		user.setUid(uid);
		return accountDao.getUserAccountByUser(user);
	}
	
	public void updateUserAccount(UserAccount userAccount){
		accountDao.updateUserAccount(userAccount);
	}
	
	public void addUserAccount(UserAccount userAccount){
		accountDao.addUserAccount(userAccount);
	}
}
