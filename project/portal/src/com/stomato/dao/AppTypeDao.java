package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AppType;
import com.stomato.domain.FormParam;

public interface AppTypeDao {

	public void addAppType(AppType appType );

	public void updateAppType(AppType appType);
	
	public void deleteAppType(int id);

	public List<AppType> listAppType(FormParam param);

	public int listTotal(FormParam param);

	public AppType getAppType(int id);
}
