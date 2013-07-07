package com.stomato.form;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.BaseParam;
import com.stomato.domain.ReportParam;

public class ReportParamForm extends BaseParam{
	
	private int uid;
	
	private int appId;
	
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
