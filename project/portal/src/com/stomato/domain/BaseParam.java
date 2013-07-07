package com.stomato.domain;

import java.util.Date;

import com.google.gson.Gson;
import com.stomato.utils.DateUtils;

public class BaseParam {
	// 开始时间
	private Date _startDate;
	// 结束时间
	private Date _endDate;

	private String startDatestr;

	private String endDatestr;
	// 行号
	int index = 1;
	// 一页显示行数
	int pageSize = 10;
	// 当前页
	int pageNum = 1;
	// 查询数据库开始行
	private Integer slimt;
	// 查询条件对象
	private Object param;

	public Object getParam() {
		return param;
	}

	public void setParam(Object param) {
		this.param = param;
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

	public Integer getSlimt() {
		return slimt;
	}

	public void setSlimt(Integer slimt) {
		this.slimt = slimt;
	}

	public String getStartDatestr() {
		return startDatestr;
	}

	public void setStartDatestr(String startDatestr) {
		this.startDatestr = startDatestr;
	}

	public String getEndDatestr() {
		return endDatestr;
	}

	public void setEndDatestr(String endDatestr) {
		this.endDatestr = endDatestr;
	}

	public Date get_startDate() {
		if (_startDate == null && startDatestr != null) {
			_startDate = DateUtils.getInstance().stringToDate(startDatestr);
		}
		return _startDate;
	}

	public void set_startDate(Date startDate) {
		this._startDate = startDate;
	}

	public Date get_endDate() {
		if (_endDate == null && endDatestr != null) {
			_endDate = DateUtils.getInstance().stringToDate(endDatestr);
		}
		return _endDate;
	}

	public void set_endDate(Date endDate) {
		this._endDate = endDate;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}