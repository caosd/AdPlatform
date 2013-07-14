package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AppType;
import com.stomato.domain.BaseParam;

public interface AppTypeDao {

	public void addAppType(AppType appType );

	public void updateAppType(AppType appType);
	
	public void deleteAppType(int id);

	public List<AppType> listAppType(BaseParam param);

	public int listTotal(AppType appType);

	public AppType getAppType(int id);
}
