package com.stomato.enums;

public enum AccountTypeEnum {
	Individual(3),//个人
	
	Company(4);
	
	private final int value;
	private AccountTypeEnum(final int value) {
		this.value = value;
	}
	public int value() {
		return this.value;
	}

}
