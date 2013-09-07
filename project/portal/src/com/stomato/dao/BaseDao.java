package com.stomato.dao;

import java.util.List;
/**
 * 通用Dao
 * @author  jiandong
 * @param <T>
 */
public interface BaseDao<T> {

	public int delete(int id);
	
	public int add(T bean);

	public int update(T bean);

	public List<T> list(Object formParam);

	public int listTotal(Object formParam);

	public T get(int id);
}
