package com.stomato.domain;

import com.google.gson.Gson;

public class ReportResult {
	
	private long idate;
	
	private long value;
	
	public long getIdate() {
		return idate;
	}

	public void setIdate(long idate) {
		this.idate = idate;
	}

	public long getValue() {
		return value;
	}

	public void setValue(long value) {
		this.value = value;
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
	public long[] toArray() {
		if (idate < 1000000000000l) {
			idate = idate * 1000;
		}
		return new long[]{idate, value};
	}
}
