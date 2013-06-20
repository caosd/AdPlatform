package com.stomato.domain;

import java.util.Date;
import java.util.List;

public class BaseParam {

	private Date startDate;
	private Date endDate;
	//查询参数
	private List<Part<String,Object>> paramList;;
	//开始行
	private int slimt;
	//页面查询多少行
	private int rows = 10;

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

	public int getSlimt() {
		return slimt;
	}

	public void setSlimt(int slimt) {
		this.slimt = slimt;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public List<Part<String,Object>> getParams() {
		return paramList;
	}

	public void setParams(List<Part<String,Object>> paramList) {
		this.paramList = paramList;
	}
}
