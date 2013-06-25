package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Menu;
import com.stomato.domain.PublicModel;


public interface MenuDao {

	Menu getMenu(int id);
	
	void updateMenu(Menu menu);
	
	void addMenu(Menu menu);
	
	int listTotal(PublicModel param);
	
	List<Menu> listMenu(PublicModel param);
}
