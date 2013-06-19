package com.stomato.dao;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.stomato.domain.Role;
import com.stomato.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:META-INF/applicationContext.xml")
public class UserDaoTest extends AbstractJUnit4SpringContextTests{

	@Resource
	private UserDao userDao;
	

	@Test
	public void verifyUser(){
		User user = new User();
		user.setUserName("jiandong");
		user = userDao.verify(user);
		System.out.println(user.getPassword());
	}
}
