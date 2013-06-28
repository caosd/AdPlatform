package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.MenuDao;
import com.stomato.domain.Menu;
import com.stomato.domain.User;

@Service
public class MenuService {

	@Autowired
	private MenuDao menuDao;

	public void addMenu(Menu menu){
		menuDao.addMenu(menu);
	}
	
	public void updateMenu(Menu meun){
		menuDao.updateMenu(meun);
	}
	
	public Menu getMenu(int id){
		return menuDao.getMenu(id);
	}
	
	public int listTotal(Menu param){
		return menuDao.listTotal(param);
	}
	
	public List<Menu> listMenu(Menu param){
		return menuDao.listMenu(param);
	}
	
	public List<Menu> listMenuByUser(User user){
		List<Menu> parentMenus =  menuDao.listParentMenuByRole(user.getRoleId());
		if( parentMenus != null ){
			for (Menu menu : parentMenus) {
				Menu parent = new Menu();
				parent.setParent(menu.getId());
				List<Menu> sunMenuList = menuDao.listMenu(parent);
				menu.setSunMenu(sunMenuList);
			}
		}
		return parentMenus;
	}
}
