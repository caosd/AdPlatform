package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AppCategory;
import com.stomato.form.AppCategoryFormParam;

public interface AppCategoryDao {

	public void addCategory(AppCategory Category );

	public void updateCategory(AppCategory Category);
	
	public void deleteCategory(int id);

	public List<AppCategory> listCategory(AppCategoryFormParam param);

	public int listTotal(AppCategoryFormParam param);

	public AppCategory getCategory(int id);
}
