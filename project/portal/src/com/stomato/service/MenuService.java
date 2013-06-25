package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.MenuDao;
import com.stomato.domain.Menu;
import com.stomato.domain.PublicModel;

@Service
public class MenuService {

	@Autowired
	private MenuDao menuDao ;

	public void addMenu(Menu menu){
		menuDao.addMenu(menu);
	}
	
	public void updateMenu(Menu meun){
		menuDao.updateMenu(meun);
	}
	
	public Menu getMenu(int id){
		return menuDao.getMenu(id);
	}
	
	public int listTotal(PublicModel param){
		return menuDao.listTotal(param);
	}
	
	public List<Menu> listMenu(PublicModel param){
		return menuDao.listMenu(param);
	}
	
	public List<Menu> getMenuSys(){
		List<Menu> menuSys = menuDao.listMenu(new PublicModel());
		if(menuSys != null){
			for(Menu menu:menuSys){
				Menu parent = new Menu();
				parent.setParent(menu.getParent());
				List<Menu> sunMenuList = menuDao.listMenu(parent);
				menu.setSunMenu(sunMenuList);
			}
		}
		return menuSys;
	}
}
