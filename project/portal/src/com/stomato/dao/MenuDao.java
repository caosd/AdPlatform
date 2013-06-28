package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Menu;


public interface MenuDao {

	Menu getMenu(int id);
	
	void deleteMenu(int id);
	
	void updateMenu(Menu menu);
	
	void addMenu(Menu menu);
	
	int listTotal(Menu param);
	
	List<Menu> listMenu(Menu param);
	
	List<Menu> listParentMenuByRole(int roleId);
}
