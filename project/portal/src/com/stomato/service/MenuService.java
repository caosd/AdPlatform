package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.MenuDao;
import com.stomato.domain.Menu;
import com.stomato.domain.MenuParam;
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
	
	public int listTotal(MenuParam menuParam){
		return menuDao.listTotal(menuParam);
	}
	
	public List<Menu> listMenu(MenuParam menuParam ){
		return menuDao.listMenu(menuParam);
	}
	
	public List<Menu> listParentMenu(){
		return menuDao.listParentMenu();
	}
	
	public List<Menu> listMenuByUser(User user){
		List<Menu> parentMenus =  menuDao.listParentMenuByRole(user.getType());
		if( parentMenus != null ){
			for (Menu menu : parentMenus) {
				MenuParam parent = new MenuParam();
				parent.setParent(menu.getId());
				parent.setVisible(1);
				List<Menu> sunMenuList = menuDao.listMenu(parent);
				menu.setSunMenu(sunMenuList);
			}
		}
		return parentMenus;
	}
}
