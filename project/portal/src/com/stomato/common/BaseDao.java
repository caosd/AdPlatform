package com.stomato.common;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.stomato.exception.DaoException;

/**
 * 底层数据访问总接口 --方法泛化.
 * 
 * @author Duke-Alliance Team
 * @since JDK1.6
 * @version 1.0
 * @history 2013-7-23 create
 */
public interface BaseDao {

	/**
	 * 添加数据
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param item
	 *            操作的实体
	 * @return 受影响行数
	 * @throws DaoException
	 */
	public <T> int insert(String statementId, T item) throws DaoException;

	/**
	 * 删除数据
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param item
	 *            操作的实体
	 * @return 受影响行数
	 * @throws DaoException
	 */
	public <T> int delete(String statementId, T item) throws DaoException;

	/**
	 * 更新数据
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param item
	 *            操作的实体
	 * @return 受影响行数
	 * @throws DaoException
	 */
	public <T> int update(String statementId, T item) throws DaoException;

	/**
	 * 查询或有记录
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @return List &ltT&gt
	 * @throws DaoException
	 */
	public <T> List<T> queryAll(String statementId) throws DaoException;

	/**
	 * 根据主键查询某条记录
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param id
	 *            主键
	 * @return T
	 * @throws DaoException
	 */
	public <T, PK extends Serializable> T queryById(String statementId, PK id) throws DaoException;

	/**
	 * 按条件查询 返回N条记录
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param conditions
	 *            参数条件
	 * @return List<T>
	 * @throws DaoException
	 */
	public <T> List<T> queryByConditions(String statementId, T conditions) throws DaoException;

	/**
	 * 按条件查询 返回N条记录
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param conditions
	 *            将查询条件设置到实体中
	 * @return List &ltT&gt
	 * @throws DaoException
	 */
	public <T> List<T> queryForListEntity(String statementId, Class<T> clazz, Object conditions) throws DaoException;

	/**
	 * 按条件查询 返回N条记录
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param conditions
	 *            将查询条件设置到实体中
	 * @return T
	 * @throws DaoException
	 */
	public <T> T queryForEntity(String statementId, Class<T> clazz, Object conditions) throws DaoException;

	/**
	 * 按条件查询 返回一条记录
	 * 
	 * @param <T>
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param item
	 *            将查询条件设置到实体中
	 * @return T
	 * @throws DaoException
	 */
	public <T> T queryObject(String statementId, T item) throws DaoException;

	/**
	 * 获取中记录数
	 * 
	 * @param statement
	 *            对应Ibatis sqlMap 中的 ID
	 * @param item
	 *            操作的实体
	 * @return long
	 * @throws DaoException
	 */
	public Long getCount(String statementId, Object item) throws DaoException;

	/**
	 * 批量操作数据(新增, 删除, 修改)
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param itemList
	 *            操作对象列表
	 * @throws DaoException
	 */
	public <T> void operateItemBatch(String statementId, final Collection<T> itemList) throws DaoException;

	/**
	 * 使用存储过程操作数据
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param parameters
	 *            String 类型参数 传入的参数规则由自己定义.在存储过程中的自己解析传入的参数.
	 * @throws DaoException
	 */
	public void callProcedures(String statementId, final Map<String , Object> parameters) throws DaoException;

}
