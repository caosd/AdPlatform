package com.stomato.form;


public class AdChannelFormParam extends PublicFormParam{

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
