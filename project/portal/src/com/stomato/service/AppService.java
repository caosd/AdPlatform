package com.stomato.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AppDao;
import com.stomato.dao.ReportDao;
import com.stomato.domain.App;
import com.stomato.domain.ReportParam;
import com.stomato.domain.ReportResult;
import com.stomato.manager.ReportEvent;
import com.stomato.manager.ReportManager;
import com.stomato.utils.ReportUtils;

@Service
public class AppService {
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private AppDao appDao;
	
	@Autowired
	private ReportDao reportDao;
	
	@Autowired
	private ReportManager<List<ReportResult>> reportManager;
	
	public int addApp(App app) {
		return appDao.addApp(app);
	}

	public App getApp(App app) {
		return appDao.getApp(app);
	}

	public List<App> getAppList(int uid) {
		return appDao.getAppList(uid);
	}
	
	public List<App> getLastedAppList(int uid) {
		return appDao.getLastedAppList(uid);
	}
	
	public void updateApp(App app) {
		appDao.updateApp(app);
	}
	
	public void deleteApp(App app) {
		appDao.deleteApp(app);
	}
	
}
