package com.stomato.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AppCategoryDao;
import com.stomato.domain.AppCategory;
import com.stomato.form.AppCategoryFormParam;

@Service
public class AppCategoryService {

	@Autowired
	private AppCategoryDao dao;

	public void addAppType(AppCategory category) {
		dao.addCategory(category);
	}

	public void updateCategory(AppCategory category) {
		dao.updateCategory(category);
	}
	public void deleteCategory(int id) {
		dao.deleteCategory(id);
	}
	public List<AppCategory> listCategory(AppCategoryFormParam param) {
		return dao.listCategory(param);
	}

	public int listTotal(AppCategoryFormParam param) {
		return dao.listTotal(param);
	}

	public AppCategory getCategory(int id) {
		return dao.getCategory(id);
	}
	public List<AppCategory> getListByParent(){
		AppCategoryFormParam formParam = new AppCategoryFormParam();
		formParam.setVisible(true);
		formParam.setParent(0);
		return dao.listCategory(formParam);
	}
	
	public List<AppCategory> getListFillSun(){
		AppCategoryFormParam formParam = new AppCategoryFormParam();
		formParam.setVisible(true);
		List<AppCategory> CategoryList = dao.listCategory(formParam);
		
		List<AppCategory> levelList = new ArrayList<AppCategory>();
		for (AppCategory Category : CategoryList) {
			if(Category.getParent().intValue() == 0){
				levelList.add(Category);
			}
		}
		for (AppCategory level : levelList) {
			List<AppCategory> sunType = new ArrayList<AppCategory>();
			for (AppCategory Category : CategoryList) {
				if(level.getId().intValue() == Category.getParent().intValue()){
					sunType.add(Category);
				}
			}
			level.setSunTypeList(sunType);
		}
		return levelList;
	}
}
