package com.stomato.common;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stomato.exception.DaoException;

/**
 * 业务数据访问的总实现类 -- 方法泛化. 这是调用DAO实现类的入口接口</br> 所有的衍化 扩展接口实现类都要从它继承
 * 
 * @author Duke-Alliance Team
 * @since JDK1.6
 * @version 1.0
 * @history 2013-7-23 create
 */
@Repository("baseDao")
public class BaseDaoImpl implements BaseDao {

	@Resource
	protected SqlSessionTemplate sqlSessionTemplate;

	public <T> int insert(String statementId, T item) throws DaoException {
		return sqlSessionTemplate.insert( statementId, item );
	}

	public <T> int delete(String statementId, T item) throws DaoException {
		return sqlSessionTemplate.delete( statementId, item );
	}

	public <T> int update(String statementId, T item) throws DaoException {
		return sqlSessionTemplate.update( statementId, item );
	}

	public <T> List<T> queryAll(String statementId) throws DaoException {
		return (List<T>) sqlSessionTemplate.selectList( statementId );
	}

	public <T, PK extends Serializable> T queryById(String statementId, PK id) throws DaoException {
		return (T) sqlSessionTemplate.selectOne( statementId, id );
	}

	public <T> List<T> queryByConditions(String statementId, T conditions) throws DaoException {
		return (List<T>) sqlSessionTemplate.selectList( statementId, conditions );
	}

	public <T> List<T> queryForListEntity(String statementId, Class<T> clazz, Object conditions) throws DaoException {
		return (List<T>) sqlSessionTemplate.selectList( statementId, conditions );
	}

	public <T> T queryForEntity(String statementId, Class<T> clazz, Object conditions) throws DaoException {
		return (T) sqlSessionTemplate.selectOne( statementId, conditions );
	}

	public <T> T queryObject(String statementId, T item) throws DaoException {
		return (T) sqlSessionTemplate.selectOne( statementId, item );
	}

	public Long getCount(String statementId, Object item) throws DaoException {
		return (Long) sqlSessionTemplate.selectOne( statementId, item );
	}

	public <T> void operateItemBatch(String statementId, Collection<T> itemList) throws DaoException {
		sqlSessionTemplate.insert( statementId, itemList );
	}

	public void callProcedures(String statementId, Map<String , Object> parameters) throws DaoException {
		// TODO
	}

}
