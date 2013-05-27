package com.stomato.enums;

public enum PaymentEnum {
	Paypal(1),
	
	Wire(2);
	
	private final int value;
	private PaymentEnum(final int value) {
		this.value = value;
	}
	public int value() {
		return this.value;
	}
}
