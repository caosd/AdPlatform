package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Menu;
import com.stomato.form.MenuFormParam;


public interface MenuDao {

	Menu getMenu(int id);
	
	void deleteMenu(int id);
	
	void updateMenu(Menu menu);
	
	void addMenu(Menu menu);
	
	int listTotal(MenuFormParam formParam);
	
	List<Menu> listMenuByIds(List<Integer> list);
	
	List<Menu> listMenu(MenuFormParam formParam);
	
	List<Menu> listParentMenu();
	
	List<Menu> listParentMenuByRole(int roleId);
}
