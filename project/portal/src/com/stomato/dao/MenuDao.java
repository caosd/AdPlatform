package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Menu;
import com.stomato.domain.PublicParam;


public interface MenuDao {

	Menu getMenu(int id);
	
	void updateMenu(Menu menu);
	
	void addMenu(Menu menu);
	
	int listTotal(PublicParam param);
	
	List<Menu> listMenu(PublicParam param);
}
