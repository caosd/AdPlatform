package com.stomato.domain;

import com.google.gson.Gson;

public class RemittanceParam extends BaseParam {

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
