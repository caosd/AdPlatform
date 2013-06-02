package com.stomato.form;

import java.util.Date;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.ReportParam;
import com.stomato.utils.DateUtils;

public class ReportParamForm {
	
	private int uid;
	
	private int appId;

	private Date startDate;
	
	private Date endDate;
	
	private String startDatestr;
	
	private String endDatestr;
	
	private String code;
	
	private int istart;
	
	private int iend;
	
	public int getIstart() {
		return istart;
	}

	public void setIstart(int istart) {
		this.istart = istart;
	}

	public int getIend() {
		return iend;
	}

	public void setIend(int iend) {
		this.iend = iend;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

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
	
	public ReportParam asPojo() {
		ReportParam reportParam = new ReportParam();
		BeanUtils.copyProperties(this, reportParam);
		return reportParam;
	}
}
