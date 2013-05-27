package com.stomato.domain;

import java.io.Serializable;
import java.util.Date;

import com.google.gson.Gson;

public class Form implements Serializable {
	
	private static final long serialVersionUID = 8796758608626021150L;
	
	public static final String FORM_UNIQ_ID_FIELD_NAME = "_form_token_";
	
	/** 表单标识*/
	private String token;
	
	/** 表单创建时间*/
	private Date createTime;
	
	public Form(String token) {
		this.token = token;
		this.createTime = new Date();
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
	public String getToken() {
		return token;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
}