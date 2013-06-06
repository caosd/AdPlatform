package com.stomato.domain;

import java.util.Date;

import com.google.gson.Gson;

public class RemittanceParam {

	private Integer uid;
	
	private Date startDate;
	
	private Date endDate;

	private Integer slimt;
	
	private Integer rows = 10;

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

	public Integer getSlimt() {
		return slimt;
	}

	public void setSlimt(Integer slimt) {
		this.slimt = slimt;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
}
