package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Menu;
import com.stomato.domain.MenuParam;


public interface MenuDao {

	Menu getMenu(int id);
	
	void deleteMenu(int id);
	
	void updateMenu(Menu menu);
	
	void addMenu(Menu menu);
	
	int listTotal(MenuParam menuParam);
	
	List<Menu> listMenu(MenuParam menuParam);
	
	List<Menu> listParentMenu();
	
	List<Menu> listParentMenuByRole(int roleId);
}
