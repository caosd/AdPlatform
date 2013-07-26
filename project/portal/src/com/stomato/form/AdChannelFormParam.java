package com.stomato.form;

import com.stomato.domain.FormParam;

public class AdChannelFormParam extends FormParam {

	private String channelName;
	private Boolean enable;

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

}
