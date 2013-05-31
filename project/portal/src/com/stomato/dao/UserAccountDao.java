package com.stomato.dao;

import com.stomato.domain.User;
import com.stomato.domain.UserAccount;

/**
 * 财务信息dao接口
 * @author  jiandong
 */
public interface UserAccountDao {
	
	UserAccount getUserAccount(UserAccount userAccount);
	
	UserAccount getUserAccountByUser(User user);
	
	void updateUserAccount(UserAccount userAccount);
	
	void addUserAccount(UserAccount userAccount);
}
