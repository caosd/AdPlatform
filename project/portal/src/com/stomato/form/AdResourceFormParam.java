package com.stomato.form;

import com.stomato.domain.FormParam;

public class AdResourceFormParam extends FormParam {

	private String adName;
	private Boolean isDel;

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}

}
