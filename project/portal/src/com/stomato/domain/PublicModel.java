package com.stomato.domain;

import java.util.Date;

public class PublicModel {

	/**
	 * 0,有效，1无效
	 */
	int status = -1;
	//开始时间
	private Date startDate;
	//结束时间
	private Date endDate;
	//行号
	int index = 1 ;
	//一页显示行数
	int pageSize = 30 ;
	//当前页
	int pageNum = 1 ;
	//查询数据库开始行
	private int slimt;

	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getSlimt() {
		return slimt;
	}
	public void setSlimt(int slimt) {
		this.slimt = slimt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
