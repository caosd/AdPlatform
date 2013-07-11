package com.stomato.enums;

public enum ReportTypeEnum {
	Hourly(1),
	
	Daliy(2),
	 
	Weekly(3),
	
	Monthly(4);
	
	private final int value;
	
	private ReportTypeEnum(final int value) {
		this.value = value;
	}
	
	public int value() {
		return this.value;
	}
	
	public static ReportTypeEnum from(int type) {
		switch (type) {
		case 1:
			return ReportTypeEnum.Hourly;
		case 2:
			return ReportTypeEnum.Daliy;
		case 3:
			return ReportTypeEnum.Weekly;
		case 4:
			return ReportTypeEnum.Monthly;
		default:
			return null;
		}
	}
}
