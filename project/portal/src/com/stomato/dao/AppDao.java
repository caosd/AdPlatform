package com.stomato.dao;

import java.util.List;
import java.util.Map;

import com.stomato.domain.App;
import com.stomato.domain.FormParam;

public interface AppDao {

	int addApp(App app);

	App getApp(App app);

	List<App> getAppList(int uid);

	List<App> getLastedAppList(int uid);

	List<App> getAllAppList(FormParam formParam);

	void updateApp(App app);

	void deleteApp(App app);

	int checkAppPackage(App app);

	int listTotal(FormParam formParam);

	List<App> listApps(FormParam formParam);

	List<Map<String, Object>> getAppListForMap(FormParam formParam);
}
