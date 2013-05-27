package com.stomato.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.stomato.dao.ExtraAppDao;
import com.stomato.domain.ExtraApp;

@Service
public class ExtraAppService {
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ExtraAppDao extraAppDao;
	
	public int addApp(ExtraApp app) {
		return extraAppDao.addApp(app);
	}

	@Cacheable("webAppCache")
	public ExtraApp getApp(int id) {
		return extraAppDao.getApp(id);
	}

	@Cacheable("webAppCache")
	public List<ExtraApp> getAppList() {
		return extraAppDao.getAppList();
	}
	
	public void updateApp(ExtraApp extraApp) {
		extraAppDao.updateApp(extraApp);
	}
	
	public void deleteApp(int id) {
		extraAppDao.deleteApp(id);
	}
}
