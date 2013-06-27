package com.stomato.dao;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.stomato.domain.Menu;
import com.stomato.domain.PublicModel;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:MET-AINF/applicationContext.xml")
public class MenuDaoTest extends AbstractJUnit4SpringContextTests{

	@Resource
	private MenuDao menuDao;
	
	@Test
	public void saveMenu(){
		Menu menu = new Menu();
		menu.setName("testMenu");
		menu.setOrderNo("1");
		menu.setParent(0);
		menu.setPath("/testMenu.action");
		menu.setVisible(1);
		menu.setName("Admin");
		menuDao.addMenu(menu);
	}
	@Test
	public void listMenu(){
		List<Menu> MenuList = menuDao.listMenu(new PublicModel());
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
		Menu.setName("admin");
		menuDao.updateMenu(Menu);
		assert Menu.getName().equals("admin");
	}
	@Test
	public void deleteMenu(){
		Menu menu = menuDao.getMenu(6);
		menuDao.deleteMenu(menu.getId());
		menu = menuDao.getMenu(6);
		assert menu == null;
	}
	@Test
	public void listTotal(){
		int total = menuDao.listTotal(new PublicModel());
		assert total > -1;
	}
}
