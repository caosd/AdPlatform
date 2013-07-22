package com.stomato.dao;

import java.util.List;

import com.stomato.domain.FormParam;
/**
 * 通用Dao
 * @author  jiandong
 * @param <T>
 */
public interface BaseDao<T> {

	public int delete(int id);
	
	public int add(T bean);

	public int update(T bean);

	public List<T> list(FormParam formParam);

	public int listTotal(FormParam formParam);

	public T get(int id);
}
