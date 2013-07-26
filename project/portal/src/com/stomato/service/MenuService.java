package com.stomato.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.MenuDao;
import com.stomato.domain.Menu;
import com.stomato.domain.User;
import com.stomato.form.MenuFormParam;

@Service
public class MenuService {

	@Autowired
	private MenuDao menuDao;
	@Autowired
	private RoleMenuService roleMenuService;
	
	public void deleteMenu(int id){
		menuDao.deleteMenu(id);
	}

	public void addMenu(Menu menu){
		menuDao.addMenu(menu);
	}
	
	public void updateMenu(Menu meun){
		menuDao.updateMenu(meun);
	}
	
	public Menu getMenu(int id){
		return menuDao.getMenu(id);
	}
	
	public int listTotal(MenuFormParam formParam){
		return menuDao.listTotal(formParam);
	}
	
	public List<Menu> listMenu(MenuFormParam formParam ){
		return menuDao.listMenu(formParam);
	}
	
	public List<Menu> listParentMenu(){
		return menuDao.listParentMenu();
	}
	
	public List<Menu> listMenuByIds(List<Integer> list){
		return menuDao.listMenuByIds(list);
	}
	
	public List<Menu> listMenuByUser(User user){
		List<Integer> idList = roleMenuService.listRoleMenu(user.getType());
		List<Menu> menuList = listMenuByIds(idList);
		List<Menu> levelMenuList = new ArrayList<Menu>();
		for (Menu menu : menuList) {
			if(menu.getParent().intValue() == 0 && menu.getVisible().intValue() == 1){
				levelMenuList.add(menu);
			}
		}
		for (Menu levelMenu : levelMenuList) {
			List<Menu> sunMenu = new ArrayList<Menu>();
			for (Menu menu : menuList) {
				if(levelMenu.getId().intValue() == menu.getParent().intValue() && menu.getVisible().intValue() == 1){
					sunMenu.add(menu);
				}
			}
			levelMenu.setSunMenu(sunMenu);
		}
		/*List<Menu> parentMenus =  menuDao.listParentMenuByRole(user.getType());
		if( parentMenus != null ){
			for (Menu menu : parentMenus) {
				MenuParam parent = new MenuParam();
				parent.setParent(menu.getId());
				parent.setVisible(1);
				List<Menu> sunMenuList = menuDao.listMenu(parent);
				menu.setSunMenu(sunMenuList);
			}
		}*/
		return levelMenuList;
	}
}
