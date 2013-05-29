package com.stomato.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.CredentialsDao;
import com.stomato.domain.Credentials;
import com.stomato.domain.User;

/**
 * 财务信息Service实现类
 * 
 * @author jiandong
 */
@Service
public class CredentialsService {

	Logger logger = Logger.getLogger(this.getClass().getName());

	@Autowired
	private CredentialsDao credentialsDao;

	public Credentials getCredentials(Credentials Credentials) {
		return this.credentialsDao.getCredentials(Credentials);
	}

	public Credentials getCredentialsByUser(User user) {
		return this.credentialsDao.getCredentialsByUser(user);
	}

	public void updateCredentials(Credentials Credentials) {
		this.credentialsDao.updateCredentials(Credentials);
	}

	public void addCredentials(Credentials Credentials) {
		this.credentialsDao.addCredentials(Credentials);
	}
}
