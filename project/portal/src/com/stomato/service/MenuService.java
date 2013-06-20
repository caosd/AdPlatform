package com.stomato.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.MenuDao;
import com.stomato.domain.BaseParam;
import com.stomato.domain.Menu;
import com.stomato.domain.Part;

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
	
	public int listTotal(BaseParam param){
		return menuDao.listTotal(param);
	}
	
	public List<Menu> listMenu(BaseParam param){
		return menuDao.listMenu(param);
	}
	
	public List<Menu> getMenuSys(){
		BaseParam param = new BaseParam();
		List<Menu> menuSys = menuDao.listMenu(param);
		if(menuSys != null){
			for(Menu menu:menuSys){
				List<Part<String, Object>> pList = new ArrayList<Part<String,Object>>(1);
				pList.add(new Part<String, Object>("parent",menu.getId()));
				param.setParams(pList);
				List<Menu> sunMenuList = menuDao.listMenu(param);
				menu.setSunMenu(sunMenuList);
			}
		}
		return menuSys;
	}
}
