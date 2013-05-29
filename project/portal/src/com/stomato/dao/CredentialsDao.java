package com.stomato.dao;

import com.stomato.domain.Credentials;
import com.stomato.domain.User;

/**
 * 财务信息dao接口
 * @author  jiandong
 */
public interface CredentialsDao {
	
	Credentials getCredentials(Credentials Credentials);
	
	public Credentials getCredentialsByUser(User user);
	
	void updateCredentials(Credentials Credentials);
	
	void addCredentials(Credentials Credentials);
}
