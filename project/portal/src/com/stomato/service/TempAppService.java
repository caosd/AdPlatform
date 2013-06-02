package com.stomato.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.TempAppDao;
import com.stomato.domain.TempApp;

@Service
public class TempAppService {
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private TempAppDao tempAppDao;
	
	public int addApp(TempApp app) {
		return tempAppDao.addApp(app);
	}

	public TempApp getApp(TempApp app) {
		return tempAppDao.getApp(app);
	}

	public List<TempApp> getAppList(int uid) {
		return tempAppDao.getAppList(uid);
	}
	
	public void updateApp(TempApp app) {
		tempAppDao.updateApp(app);
	}
	
	public void deleteApp(TempApp app) {
		tempAppDao.deleteApp(app);
	}
	
}
