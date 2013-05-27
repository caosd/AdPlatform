package com.stomato.dao;

import java.util.List;
import com.stomato.domain.ExtraApp;

public interface ExtraAppDao {
	
	int addApp(ExtraApp extraApp);
	
	ExtraApp getApp(int id);
	
	List<ExtraApp> getAppList();
	
	void updateApp(ExtraApp extraApp);
	
	void deleteApp(int id);
	
}
