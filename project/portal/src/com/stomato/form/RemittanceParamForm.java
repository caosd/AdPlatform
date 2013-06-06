package com.stomato.form;

import java.io.Serializable;
import java.util.Date;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.RemittanceParam;
import com.stomato.utils.DateUtils;

/**
 * 申请汇款信息表
 * @author  jiandong
 */
public class RemittanceParamForm implements Serializable {
	
	private static final long serialVersionUID = -2236756543461586745L;

	private Date startDate;
	
	private Date endDate;
	
	private String startDatestr;
	
	private String endDatestr;

	private int slimt;
	
	private int rows =10;

	public Date getStartDate() {
		if(startDate == null && startDatestr != null ){
			startDate = DateUtils.getInstance().stringToDate(startDatestr);
		}
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		if(endDate == null && endDatestr != null ){
			endDate = DateUtils.getInstance().stringToDate(endDatestr);
		}
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

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	public RemittanceParam asPojo() {
		RemittanceParam remittanceParam = new RemittanceParam();
		BeanUtils.copyProperties(this, remittanceParam);
		return remittanceParam;
	}
}

