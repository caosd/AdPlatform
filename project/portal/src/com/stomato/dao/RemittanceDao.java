package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Remittance;
import com.stomato.domain.RemittanceParam;

/**
 * 申请汇款dao接口
 * @author  jiandong
 */
public interface RemittanceDao {

	Remittance getRemittance(Remittance remittance);
	
	List<Remittance> getRemittanceListByUser(RemittanceParam param);
	
	List<Remittance> getRemittanceList(RemittanceParam param);
	
	int getRemittanceCount(RemittanceParam param);
	
	void updateRemittance(Remittance remittance);
	
	void updateRemittanceStatus(Remittance remittance);
	
	void addRemittance(Remittance remittance);
}
