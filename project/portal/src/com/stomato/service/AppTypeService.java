package com.stomato.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AppTypeDao;
import com.stomato.domain.AppType;
import com.stomato.form.AppTypeFormParam;

@Service
public class AppTypeService {

	@Autowired
	private AppTypeDao appTypeDao;

	public void addAppType(AppType AppType) {
		appTypeDao.addAppType(AppType);
	}

	public void updateAppType(AppType AppType) {
		appTypeDao.updateAppType(AppType);
	}
	public void deleteAppType(int id) {
		appTypeDao.deleteAppType(id);
	}
	public List<AppType> listAppType(AppTypeFormParam param) {
		return appTypeDao.listAppType(param);
	}

	public int listTotal(AppTypeFormParam param) {
		return appTypeDao.listTotal(param);
	}

	public AppType getAppType(int id) {
		return appTypeDao.getAppType(id);
	}
	public List<AppType> getListByParent(){
		AppTypeFormParam formParam = new AppTypeFormParam();
		formParam.setVisible(true);
		formParam.setParent(0);
		return appTypeDao.listAppType(formParam);
	}
	
	public List<AppType> getListFillSun(){
		AppTypeFormParam formParam = new AppTypeFormParam();
		formParam.setVisible(true);
		List<AppType> appTypeList = appTypeDao.listAppType(formParam);
		
		List<AppType> levelList = new ArrayList<AppType>();
		for (AppType appType : appTypeList) {
			if(appType.getParent().intValue() == 0){
				levelList.add(appType);
			}
		}
		for (AppType level : levelList) {
			List<AppType> sunType = new ArrayList<AppType>();
			for (AppType appType : appTypeList) {
				if(level.getId().intValue() == appType.getParent().intValue()){
					sunType.add(appType);
				}
			}
			level.setSunTypeList(sunType);
		}
		return levelList;
	}
}
