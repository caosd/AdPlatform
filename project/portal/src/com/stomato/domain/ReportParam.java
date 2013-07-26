package com.stomato.domain;

import com.google.gson.Gson;
import com.stomato.enums.ReportTypeEnum;

public class ReportParam{
	
	private int uid;
	
	private int appId;
	
	private ReportTypeEnum reportType;
	
	private String code;

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
	}
 
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
}
