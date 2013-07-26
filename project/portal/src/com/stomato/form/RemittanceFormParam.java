package com.stomato.form;

import com.google.gson.Gson;
import com.stomato.domain.FormParam;

/**
 * 申请汇款信息表
 * @author  jiandong
 */
public class RemittanceFormParam extends FormParam{

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

