package com.stomato.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.stomato.dao.ConfigDao;

@Service
public class ConfigService {
	
	@Autowired
	private ConfigDao configDao;
	
	@Cacheable("sysConfigCache")
	public String loadConfig(String cmdName) {
		return configDao.getConfig(cmdName);
	}
}
