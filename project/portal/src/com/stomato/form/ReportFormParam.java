package com.stomato.form;

import com.google.gson.Gson;

public class ReportFormParam extends PublicFormParam{

	private Integer appId;

	private String code;
	
	private Integer uid;
 

	public Integer getAppId() {
		return appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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
