package com.stomato.form;

import com.google.gson.Gson;

/**
 * 申请汇款信息表
 * 
 * @author jiandong
 */
public class RemittanceFormParam extends PublicFormParam{

	private Integer uid;

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
