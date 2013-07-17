package com.stomato.dao;

import java.util.List;

import com.stomato.domain.BaseParam;
/**
 * 通用Dao
 * @author  jiandong
 * @param <T>
 */
public interface BaseDao<T> {

	public void add(T bean);

	public void update(T bean);

	public List<T> list(BaseParam param);

	public int listTotal(T bean);

	public T get(int id);
}
