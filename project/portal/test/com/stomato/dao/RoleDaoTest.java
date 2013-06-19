package com.stomato.dao;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
	public void getAllRoleList(){
		List<Role> roleList = roleDao.getAllRoleList();
		for (Role role : roleList) {
			System.out.println("roleName:" + role.getRoleName());
		}
	}
}
