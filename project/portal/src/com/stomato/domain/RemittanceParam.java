package com.stomato.domain;

import java.util.Date;

import com.google.gson.Gson;

public class RemittanceParam {

	private Date startDate;
	
	private Date endDate;

	private int slimt;
	
	private int rows = 2;

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

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
}
