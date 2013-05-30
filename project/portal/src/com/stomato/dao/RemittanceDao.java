package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Remittance;

/**
 * 申请汇款dao接口
 * @author  jiandong
 */
public interface RemittanceDao {

	Remittance getRemittance(Remittance remittance);
	
	List<Remittance> getRemittanceList(int uid);
	
	void updateRemittance(Remittance remittance);
	
	void addRemittance(Remittance remittance);
}
