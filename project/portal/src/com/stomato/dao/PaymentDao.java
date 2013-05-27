package com.stomato.dao;

import com.stomato.domain.Payment;

public interface PaymentDao {
	
	void insert(Payment payment);
	
	void update(Payment payment);
	
	Payment select(int uid);
	
}
