package com.stomato.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.stomato.exception.DaoException;
import com.stomato.exception.ServiceException;
import com.stomato.utils.Page;

/**
 * 业务数据访问总接口 --方法泛化. </br> 这是调用DAO接口的入口接口</br> 所有的衍化 扩展接口都要从它继承
 * 
 * @author Duke-Alliance Team
 * @since JDK1.6
 * @version 1.0
 * @history 2013-7-23 create
 */
public interface PublicService {

	// 公共分页 SQL 前缀.(仅用于 ORACLE 数据库)
	public static final String ORACLE_PAGINATION_SQL_PREFIX = " SELECT * FROM ( SELECT ROWNUM RN , TMP_PAGINATION_TABLE.* FROM ( ";
	// 公共分页 SQL 后缀.(仅用于ORACLE 数据库)
	public static final String ORACLE_PAGINATION_SQL_SUFFIX = " )AS TMP_PAGINATION_TABLE WHERE ROWNUM <= {0} ) WHERE RN > {1} ";

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
	public <T> int insert(String statementId, T item) throws ServiceException, DaoException;

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
	public <T> int delete(String statementId, T item) throws ServiceException, DaoException;

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
	public <T> int update(String statementId, T item) throws ServiceException, DaoException;

	/**
	 * 查询或有记录
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @return List &ltT&gt
	 * @throws DaoException
	 */
	public <T> List<T> queryAll(String statementId) throws ServiceException, DaoException;

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
	public <T, PK extends Serializable> T queryById(String statementId, PK id) throws ServiceException, DaoException;

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
	public <T> List<T> queryByConditions(String statementId, T conditions) throws ServiceException, DaoException;

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
	public <T> List<T> queryForListEntity(String statementId, Class<T> clazz, Object conditions) throws ServiceException, DaoException;

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
	public <T> T queryForEntity(String statementId, Class<T> clazz, Object conditions) throws ServiceException, DaoException;

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
	public <T> T queryObject(String statementId, T item) throws ServiceException, DaoException;

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
	public Long getCount(String statementId, Object item) throws ServiceException, DaoException;

	/**
	 * 分页查询接口
	 * 
	 * @param queryCountStatementId
	 *            查询总记录数据的 SqlId, 对应Ibatis sqlMap 中的配置的 ID
	 * @param queryRecordStatementId
	 *            查询记录数据的 SqlId, 对应Ibatis sqlMap 中的配置的 ID
	 * @param parameter
	 *            参数只接收 HashMap 类型 或者 继承 com.powerall.icms.model.Page 类的对象.
	 * @return Page &ltT&gt
	 * @throws DaoException
	 * @throws Exception
	 */
	public <T> Page<T> queryInPage(String queryCountStatementId, String queryRecordStatementId, T parameter) throws ServiceException, DaoException, Exception;

	/**
	 * 分页查询接口,这个接口是用于 ORACLE 数据库分页查询
	 * 
	 * @param queryCountStatementId
	 *            查询总记录数据的 SqlId, 对应Ibatis sqlMap 中的配置的 ID
	 * @param queryRecordStatementId
	 *            查询记录数据的 SqlId, 对应Ibatis sqlMap 中的配置的 ID
	 * @param parameter
	 *            参数只接收 HashMap 类型 或者 继承 com.powerall.icms.model.Page 类的对象.
	 * @return Page &ltT&gt
	 * @throws DaoException
	 * @throws Exception
	 */
	public <T> Page<T> queryInPageFromOracle(String queryCountStatementId, String queryRecordStatementId, T parameter) throws ServiceException, DaoException, Exception;

	/**
	 * 批量操作数据(新增, 删除, 修改)
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param itemList
	 *            操作对象列表
	 * @throws DaoException
	 */
	public <T> void operateItemBatch(String statementId, final Collection<T> itemList) throws ServiceException, DaoException;

	/**
	 * 使用存储过程操作数据
	 * 
	 * @param statementId
	 *            对应Ibatis sqlMap 中的配置的 ID
	 * @param parameters
	 *            String 类型参数 传入的参数规则由自己定义.在存储过程中的自己解析传入的参数.
	 * @throws DaoException
	 */
	public void callProcedures(String statementId, final Map<String , Object> parameters) throws ServiceException, DaoException;
}
