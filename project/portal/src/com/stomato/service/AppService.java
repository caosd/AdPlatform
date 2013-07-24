package com.stomato.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AppDao;
import com.stomato.domain.App;
import com.stomato.domain.FormParam;

@Service
public class AppService {

	Logger logger = Logger.getLogger(this.getClass().getName());

	@Autowired
	private AppDao appDao;

	public int addApp(App app) {
		return appDao.addApp(app);
	}

	public App getApp(App app) {
		return appDao.getApp(app);
	}

	public int listTotal(FormParam formParam) {
		return appDao.listTotal(formParam);
	}

	public List<App> listApps(FormParam formParam) {
		return appDao.listApps(formParam);
	}
	
	public List<Map<String,Object>> getAppListForMap(FormParam formParam){
		return appDao.getAppListForMap(formParam);
	}

	public List<App> getAppList(int uid) {
		return appDao.getAppList(uid);
	}

	public List<App> getLastedAppList(int uid) {
		return appDao.getLastedAppList(uid);
	}

	public List<App> getAllAppList(FormParam param) {
		return appDao.getAllAppList(param);
	}

	public void updateApp(App app) {
		appDao.updateApp(app);
	}

	public void deleteApp(App app) {
		appDao.deleteApp(app);
	}

	public boolean checkAppPackage(App app) {
		return appDao.checkAppPackage(app) == 1;
	}

}
