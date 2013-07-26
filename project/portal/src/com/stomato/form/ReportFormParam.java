package com.stomato.form;

import com.google.gson.Gson;
import com.stomato.domain.FormParam;

public class ReportFormParam extends FormParam {

	private int appId;

	private String code;

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public int getAppId() {
		return appId;
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
}
