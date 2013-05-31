package com.stomato.form;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.gson.Gson;
import com.stomato.enums.ReportTypeEnum;

public class ReportParamForm {
	
	private int uid;
	
	private int appId;

	private Date startDate;
	
	private Date endDate;
	
	private ReportTypeEnum reportType;
	
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

	public ReportTypeEnum getReportType() {
		return reportType;
	}

	public void setReportType(ReportTypeEnum reportType) {
		this.reportType = reportType;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		switch(this.reportType) {
		case Monthly:
			sdf = new SimpleDateFormat("yyyyMM");
			break;
		}
		if (this.startDate != null)
			this.istart = Integer.parseInt(sdf.format(this.startDate));
		if (this.endDate != null)
			this.iend = Integer.parseInt(sdf.format(this.endDate));
	}

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
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
}
