package com.stomato.dao;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.stomato.domain.PublicModel;
import com.stomato.domain.Role;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:META-INF/applicationContext.xml")
public class RoleDaoTest extends AbstractJUnit4SpringContextTests{

	@Resource
	private RoleDao roleDao;
	
	@Test
	public void saveRole(){
		Role role = new Role();
		role.setRoleName("Admin");
		roleDao.addRole(role);
	}
	@Test
	public void listRole(){
		List<Role> roleList = roleDao.listRole(new PublicModel());
		assert roleList.size() > 0;
	}
	@Test
	public void getRole(){
		Role role = roleDao.getRole(2);
		assert role.getId() == 2;
	}
	@Test
	public void updateRole(){
		Role role = roleDao.getRole(6);
		role.setRoleName("admin");
		roleDao.updateRole(role);
		assert role.getRoleName().equals("admin");
	}
	@Test
	public void deleteRole(){
		Role role = roleDao.getRole(6);
		roleDao.deleteRole(role);
		role = roleDao.getRole(6);
		assert role == null;
	}
	@Test
	public void listTotal(){
		int total = roleDao.listTotal(new PublicModel());
		assert total > -1;
	}
}
