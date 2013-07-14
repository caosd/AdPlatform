package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AppTypeDao;
import com.stomato.domain.AppType;
import com.stomato.domain.BaseParam;

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
	public List<AppType> listAppType(BaseParam param) {
		return appTypeDao.listAppType(param);
	}

	public int listTotal(AppType AppType) {
		return appTypeDao.listTotal(AppType);
	}

	public AppType getAppType(int id) {
		return appTypeDao.getAppType(id);
	}
	public List<AppType> getListByParent(){
		BaseParam param = new BaseParam();
		AppType appType = new AppType();
		appType.setParent(0);
		param.setParam(appType);
		return appTypeDao.listAppType(param);
	}
}
