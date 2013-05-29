package com.stomato.dao;

import com.stomato.domain.Remittance;

/**
 * 申请汇款dao接口
 * @author  jiandong
 */
public interface RemittanceDao {

	Remittance getRemittance(Remittance remittance);
	
	void updateRemittance(Remittance remittance);
	
	void addRemittance(Remittance remittance);
}
