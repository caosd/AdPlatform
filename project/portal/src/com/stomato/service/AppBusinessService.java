package com.stomato.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AppBusinessDao;
import com.stomato.domain.AppBusiness;

@Service
public class AppBusinessService {
	
	@Autowired
	private AppBusinessDao appBusinessDao;
	
	public int add(AppBusiness appBusiness) {
		return appBusinessDao.add(appBusiness);
	}
	
	public boolean update(AppBusiness appBusiness) {
		return appBusinessDao.update(appBusiness) > 0;
	}
}
