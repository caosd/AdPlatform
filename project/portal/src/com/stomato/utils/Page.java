package com.stomato.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.stomato.constant.Constant;

/**
 * 此类用于后台返回的数据进行封装翻页信息.
 * 
 * @author Tank
 * @since JDK1.6
 * @version 1.0
 * @history 2013-7-23 create
 */
public class Page<T> implements Serializable {

	private static final long serialVersionUID = 6277576102712601026L;

	// 当前页码
	private long pageNo = 1L;
	// 每页显示条目数.
	private long pageSize = Constant.SYS_CONFIG.PAGE_SIZE;
	// 总页数
	private long totalPage = 0L;
	// 总记录数
	private long totalRecord = 0L;
	// 起始值 pageNo * pageSize - pageSize
	private long beginNo = 0L;
	// 数据集
	private List<T> dataList;
	// 首页 Home-Page
	private boolean home = false;
	// 上一页 Pre-Page
	private boolean prev = false;
	// 下一页Next-Page
	private boolean next = false;
	// 尾页 End-Page
	private boolean last = false;

	// 分页 sql 前缀(只用于ORACLE DB)
	private String PAGINATION_SQL_PREFIX = "";
	// 分页 sql 后缀(只用于ORACLE DB)
	private String PAGINATION_SQL_SUFFIX = "";

	public Page() {
	}

	/**
	 * 处理 List<T> 实体对象集合数据
	 * 
	 * @param beginNo
	 *            起始值
	 * @param pageNo
	 *            当前页码
	 * @param pageSize
	 *            每页显示记录数
	 * @param count
	 *            总记录数
	 * @param dataList
	 *            数据库查询返回的结果集
	 */
	public Page(long pageNo, long pageSize, long totalRecord, List<T> dataList) {
		// 每页起始值, pageNo * pageSize - pageSize
		this.beginNo = pageNo * pageSize - pageSize;
		// 总记录数
		this.totalRecord = totalRecord;
		// 每页显示记录数
		this.pageSize = pageSize > 0 ? pageSize : this.pageSize;
		// 求总页数
		this.totalPage = totalRecord / pageSize + (totalRecord % pageSize == 0 ? 0 : 1);
		// 判断页码是否小于1
		pageNo = pageNo <= 0 ? 1 : pageNo;
		// 当前页码
		this.pageNo = pageNo < totalPage ? pageNo : totalPage;
		// 数据集
		this.dataList = dataList;
		// 刷新按钮是否可用.
		this.refresh( this.pageNo, this.totalPage );
	}

	/**
	 * 刷新按钮是否可用.
	 * 
	 * @param pageNo
	 * @param pageTotal
	 */
	private void refresh(long pageNo, long pageTotal) {
		if (pageTotal == 1) {
			// 如果数据只有一页,那么所有的翻页按钮都不能是用
			this.setBtnEnable( false, false, false, false );
		} else if (pageNo <= 1) {
			// 如果当前页为第一页
			this.setBtnEnable( false, false, true, true );
		} else if (pageNo > 1 && pageNo < pageTotal) {
			// 如果当前页为 大于第一页 并且小于总页数
			this.setBtnEnable( true, true, true, true );
		} else if (pageNo >= pageTotal) {
			// 如果当前页大于或等于总页数
			this.setBtnEnable( true, true, false, false );
		}
	}

	/**
	 * 
	 * 设定 按钮的可用性 true:可用, false:不可用
	 * 
	 * @param home
	 *            首页
	 * @param prev
	 *            上一页
	 * @param next
	 *            下一页
	 * @param last
	 *            尾页
	 */
	private void setBtnEnable(boolean home, boolean prev, boolean next, boolean last) {
		this.home = home;
		this.prev = prev;
		this.next = next;
		this.last = last;
	}

	public long getPageNo() {
		return pageNo;
	}

	public void setPageNo(long pageNo) {
		this.pageNo = pageNo;
	}

	public long getPageSize() {
		return pageSize;
	}

	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}

	public long getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(long totalRecord) {
		this.totalRecord = totalRecord;
	}

	public long getBeginNo() {
		return beginNo;
	}

	public void setBeginNo(long beginNo) {
		this.beginNo = beginNo;
	}

	public List<T> getDataList() {
		return this.dataList == null ? new ArrayList<T>() : this.dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public boolean isHome() {
		return home;
	}

	public void setHome(boolean home) {
		this.home = home;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isLast() {
		return last;
	}

	public void setLast(boolean last) {
		this.last = last;
	}

	public String getPAGINATION_SQL_PREFIX() {
		return PAGINATION_SQL_PREFIX;
	}

	public void setPAGINATION_SQL_PREFIX(String pAGINATION_SQL_PREFIX) {
		PAGINATION_SQL_PREFIX = pAGINATION_SQL_PREFIX;
	}

	public String getPAGINATION_SQL_SUFFIX() {
		return PAGINATION_SQL_SUFFIX;
	}

	public void setPAGINATION_SQL_SUFFIX(String pAGINATION_SQL_SUFFIX) {
		PAGINATION_SQL_SUFFIX = pAGINATION_SQL_SUFFIX;
	}
}
