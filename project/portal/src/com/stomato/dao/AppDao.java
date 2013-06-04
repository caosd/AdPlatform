package com.stomato.dao;

import java.util.List;
import com.stomato.domain.App;

public interface AppDao {
	
	int addApp(App app);
	
	App getApp(App app);
	
	List<App> getAppList(int uid);
	
	List<App> getLastedAppList(int uid);
	
	void updateApp(App app);
	
	void deleteApp(App app);
	
	int checkAppPackage(App app);
}
