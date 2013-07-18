package com.stomato.form;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.BaseParam;
import com.stomato.domain.RemittanceParam;

/**
 * 申请汇款信息表
 * @author  jiandong
 */
public class RemittanceParamForm extends BaseParam{

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
	public RemittanceParam asPojo() {
		RemittanceParam remittanceParam = new RemittanceParam();
		BeanUtils.copyProperties(this, remittanceParam);
		return remittanceParam;
	}
}

