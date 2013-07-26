package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AppType;
import com.stomato.form.AppTypeFormParam;

public interface AppTypeDao {

	public void addAppType(AppType appType );

	public void updateAppType(AppType appType);
	
	public void deleteAppType(int id);

	public List<AppType> listAppType(AppTypeFormParam param);

	public int listTotal(AppTypeFormParam param);

	public AppType getAppType(int id);
}
