package com.stomato.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AppTypeDao;
import com.stomato.domain.AppType;
import com.stomato.domain.FormParam;

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
	public List<AppType> listAppType(FormParam param) {
		return appTypeDao.listAppType(param);
	}

	public int listTotal(FormParam param) {
		return appTypeDao.listTotal(param);
	}

	public AppType getAppType(int id) {
		return appTypeDao.getAppType(id);
	}
	public List<AppType> getListByParent(){
		BaseParam param = new BaseParam();
		AppType appType = new AppType();
		appType.setVisible(true);
		appType.setParent(0);
		param.setParam(appType);
		return appTypeDao.listAppType(param);
	}
	
	public List<AppType> getListFillSun(){
		BaseParam base = new BaseParam();
		AppType param = new AppType();
		param.setVisible(true);
		base.setParam(param);
		List<AppType> appTypeList = appTypeDao.listAppType(base);
		
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
