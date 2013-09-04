package com.stomato.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.stomato.common.BaseDao;
import com.stomato.constant.Constant;
import com.stomato.exception.DaoException;
import com.stomato.exception.ServiceException;
import com.stomato.utils.Page;
import com.stomato.utils.StringUtils;

/**
 * 对 Service 层提供的业务数据处理接口实现类. </br> 在一般情况下 比如单个表中的数据进行 增, 删, 改, 查
 * 等操作时Action中仅需注入 IAccessService 即可.</br> 若同时对N个表进行操作时那么应该重新定义特殊接口,</br>
 * 建议继承AccessServiceImpl且实现IAccessService接口.</br> 目的主要是保证操作的事务能够同步.</br>
 * 
 * @author Duke-Alliance Team
 * @since JDK1.6
 * @version 1.0
 * @history 2013-7-23 create
 */
@Service("baseService")
public class BaseServiceImpl implements BaseService {
	private static Logger logger = Logger.getLogger( BaseServiceImpl.class );
	@Resource
	private BaseDao baseDao;

	public <T> int insert(String statementId, T item) throws ServiceException, DaoException {
		return baseDao.insert( statementId, item );
	}

	public <T> int delete(String statementId, T item) throws ServiceException, DaoException {
		return baseDao.delete( statementId, item );
	}

	public <T> int update(String statementId, T item) throws ServiceException, DaoException {
		return baseDao.update( statementId, item );
	}

	public <T> List<T> queryAll(String statementId) throws ServiceException, DaoException {
		return baseDao.queryAll( statementId );
	}

	public <T, PK extends Serializable> T queryById(String statementId, PK id) throws ServiceException, DaoException {
		return baseDao.queryById( statementId, id );
	}

	public <T> List<T> queryByConditions(String statementId, T conditions) throws ServiceException, DaoException {
		return baseDao.queryByConditions( statementId, conditions );
	}

	public <T> T queryObject(String statementId, T item) throws ServiceException, DaoException {
		return baseDao.queryObject( statementId, item );
	}

	public <T> List<T> queryForListEntity(String statementId, Class<T> clazz, Object conditions) throws ServiceException, DaoException {
		return baseDao.queryForListEntity( statementId, clazz, conditions );
	}

	public <T> T queryForEntity(String statementId, Class<T> clazz, Object conditions) throws ServiceException, DaoException {
		return baseDao.queryForEntity( statementId, clazz, conditions );
	}

	public Long getCount(String statementId, Object item) throws ServiceException, DaoException {
		return baseDao.getCount( statementId, item );
	}

	public <T> Page<T> queryInPage(String queryCountStatementId, String queryRecordStatementId, T parameter) throws DaoException, Exception {
		List<T> dataList = new ArrayList<T>();
		long beginNo = 0;
		long pageNo = 1;
		long pageSize = Constant.SYS_CONFIG.PAGE_SIZE; // 初始化默认每页记录数

		// 如果parameter参数类型是 继承于 Page 类 实例对象
		if (Page.class.equals( parameter.getClass().getSuperclass() )) {
			Page<?> page = (Page<?>) parameter;
			pageNo = page.getPageNo();
			logger.debug( page.getPageSize() <= 0L ? "Use default pageSize:" + pageSize : "Use your settings PageSize:" + page.getPageSize() );
			pageSize = page.getPageSize() <= 0L ? pageSize : page.getPageSize();
			// 计算起始值
			beginNo = pageNo * pageSize - pageSize;
			page.setBeginNo( beginNo );
		}
		// 如果parameter参数类型是 HashMap
		else if (HashMap.class.equals( parameter.getClass() )) {
			@SuppressWarnings("unchecked")
			Map<String , Object> param = (HashMap<String , Object>) parameter;
			pageNo = Long.parseLong( StringUtils.isNullOrEmpty( param.get( "pageNo" ) ) ? "0" : param.get( "pageNo" ).toString().trim() );
			logger.debug( StringUtils.isNullOrEmpty( param.get( "pageSize" ) ) ? "Use default pageSize:" + pageSize : "Use your settings PageSize:" + param.get( "pageSize" ).toString().trim() );
			pageSize = Long.parseLong( StringUtils.isNullOrEmpty( param.get( "pageSize" ) ) ? pageSize + "" : param.get( "pageSize" ).toString().trim() );
			// 计算起始值
			beginNo = pageNo * pageSize - pageSize;
			param.put( "beginNo", beginNo );
			param.put( "pageSize", pageSize );
		} else {
			throw new IllegalArgumentException( "parameter's type must be HashMap<String, Object> class or extend com.powerall.icms.model.Page" );
		}

		// 查询总记录数
		long totalRecord = baseDao.getCount( queryCountStatementId, parameter );
		// 查询结果集的条件是 总记录数 必需 大于 0 , 并且 起始值必需小于总记录数,
		if (totalRecord > 0 && beginNo < totalRecord) {
			// 查询结果集
			dataList = baseDao.queryByConditions( queryRecordStatementId, parameter );
		}
		return new Page<T>( pageNo , pageSize , totalRecord , dataList );
	}

	public <T> Page<T> queryInPageFromOracle(String queryCountStatementId, String queryRecordStatementId, T parameter) throws DaoException, Exception {
		List<T> dataList = new ArrayList<T>();
		long beginNo = 0;
		long endNo = 0;
		long pageNo = 1;
		long pageSize = Constant.SYS_CONFIG.PAGE_SIZE; // 初始化默认每页记录数

		// 如果parameter参数类型是 继承于 Page 类 实例对象
		if (Page.class.equals( parameter.getClass().getSuperclass() )) {
			Page<?> page = (Page<?>) parameter;
			pageNo = page.getPageNo();
			logger.debug( page.getPageSize() <= 0L ? "Use default pageSize:" + pageSize : "Use your settings PageSize:" + page.getPageSize() );
			pageSize = page.getPageSize() <= 0L ? pageSize : page.getPageSize();
			// 计算起始值
			beginNo = (pageNo - 1) * pageSize;
			// 计算结束值
			endNo = pageNo * pageSize;
			page.setPAGINATION_SQL_PREFIX( ORACLE_PAGINATION_SQL_PREFIX );
			page.setPAGINATION_SQL_SUFFIX( ORACLE_PAGINATION_SQL_SUFFIX.replace( "{0}", endNo + "" ).replace( "{1}", beginNo + "" ) );
		}
		// 如果parameter参数类型是 HashMap
		else if (HashMap.class.equals( parameter.getClass() )) {
			@SuppressWarnings("unchecked")
			Map<String , Object> param = (HashMap<String , Object>) parameter;
			pageNo = Long.parseLong( StringUtils.isNullOrEmpty( param.get( "pageNo" ) ) ? "0" : param.get( "pageNo" ).toString().trim() );
			logger.debug( StringUtils.isNullOrEmpty( param.get( "pageSize" ) ) ? "Use default pageSize:" + pageSize : "Use your settings PageSize:" + param.get( "pageSize" ).toString().trim() );
			pageSize = Long.parseLong( StringUtils.isNullOrEmpty( param.get( "pageSize" ) ) ? pageSize + "" : param.get( "pageSize" ).toString().trim() );
			// 计算起始值
			beginNo = (pageNo - 1) * pageSize;
			// 计算结束值
			endNo = pageNo * pageSize;
			param.put( "PAGINATION_SQL_PREFIX", ORACLE_PAGINATION_SQL_PREFIX );
			param.put( "PAGINATION_SQL_SUFFIX", ORACLE_PAGINATION_SQL_SUFFIX.replace( "{0}", endNo + "" ).replace( "{1}", beginNo + "" ) );
		} else {
			throw new IllegalArgumentException( "parameter's type must be HashMap<String, Object> class or extend com.powerall.icms.model.Page" );
		}

		// 查询总记录数
		long totalRecord = baseDao.getCount( queryCountStatementId, parameter );
		// 查询结果集的条件是 总记录数 必需 大于 0 , 并且 起始值必需小于总记录数,
		if (totalRecord > 0 && beginNo < totalRecord) {
			// 查询结果集
			dataList = baseDao.queryByConditions( queryRecordStatementId, parameter );
		}
		Page<T> page = new Page<T>( pageNo , pageSize , totalRecord , dataList );
		return page;
	}

	public <T> void operateItemBatch(String statementId, Collection<T> itemList) throws ServiceException, DaoException {
		baseDao.operateItemBatch( statementId, itemList );
	}

	public void callProcedures(String statementId, Map<String , Object> parameters) throws ServiceException, DaoException {
		baseDao.callProcedures( statementId, parameters );
	}

}
