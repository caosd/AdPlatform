package com.stomato.dao;

import java.util.List;
import com.stomato.domain.TempApp;

public interface TempAppDao {
	
	int addApp(TempApp app);
	
	TempApp getApp(TempApp app);
	
	List<TempApp> getAppList(int uid);
	
	void updateApp(TempApp app);
	
	void deleteApp(TempApp app);
	
}