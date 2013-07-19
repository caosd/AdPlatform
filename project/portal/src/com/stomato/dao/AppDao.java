package com.stomato.dao;

import java.util.List;
import com.stomato.domain.App;
import com.stomato.domain.BaseParam;

public interface AppDao {
	
	int addApp(App app);
	
	App getApp(App app);
	
	List<App> getAppList(int uid);
	
	List<App> getLastedAppList(int uid);
	
	List<App> getAllAppList(BaseParam param);
	
	void updateApp(App app);
	
	void deleteApp(App app);
	
	int checkAppPackage(App app);

	int listTotal(App app);

	List<App> listApps(BaseParam baseParam);
}
