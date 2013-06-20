package com.stomato.dao;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.stomato.domain.Part;
import com.stomato.domain.PublicParam;
import com.stomato.domain.Menu;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:META-INF/applicationContext.xml")
public class MenuDaoTest extends AbstractJUnit4SpringContextTests{

	@Resource
	private MenuDao menuDao;
	
	@Test
	public void saveMenu(){
		Menu menu = new Menu();
		menu.setName("testMenu");
		menu.setOrderNo(1);
		menu.setParent(0);
		menu.setPath("/testMenu.action");
		menu.setVisible(1)
		menu.setMenuName("Admin");
		menuDao.addMenu(Menu);
	}
	@Test
	public void listMenu(){
		List<Menu> MenuList = menuDao.listMenu(new PublicParam());
		assert MenuList.size() > 0;
	}
	@Test
	public void getMenu(){
		Menu Menu = menuDao.getMenu(2);
		assert Menu.getId() == 2;
	}
	@Test
	public void updateMenu(){
		Menu Menu = menuDao.getMenu(6);
		Menu.setMenuName("admin");
		menuDao.updateMenu(Menu);
		assert Menu.getMenuName().equals("admin");
	}
	@Test
	public void deleteMenu(){
		Menu Menu = menuDao.getMenu(6);
		menuDao.deleteMenu(Menu);
		Menu = menuDao.getMenu(6);
		assert Menu == null;
	}
	@Test
	public void listTotal(){
		PublicParam publicParam = new PublicParam();
		List<Part<String, Object>> paramList = new ArrayList<Part<String,Object>>();
		paramList.add(new Part<String,Object>("Menu_name", "Admin"));
		publicParam.setParams(paramList);
		int total = menuDao.listTotal(publicParam);
		assert total > -1;
	}
}
