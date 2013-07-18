package com.stomato.domain;

public class AppBusiness {
	
	private int appId;
	
	private boolean allowPush;
	
	private boolean allowRichPush;
	
	private boolean allowLBS;

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public boolean isAllowPush() {
		return allowPush;
	}

	public void setAllowPush(boolean allowPush) {
		this.allowPush = allowPush;
	}

	public boolean isAllowRichPush() {
		return allowRichPush;
	}

	public void setAllowRichPush(boolean allowRichPush) {
		this.allowRichPush = allowRichPush;
	}

	public boolean isAllowLBS() {
		return allowLBS;
	}

	public void setAllowLBS(boolean allowLBS) {
		this.allowLBS = allowLBS;
	}
}
