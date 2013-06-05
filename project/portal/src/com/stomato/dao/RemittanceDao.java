package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Remittance;
import com.stomato.domain.RemittanceParam;
import com.stomato.domain.User;

/**
 * 申请汇款dao接口
 * @author  jiandong
 */
public interface RemittanceDao {

	Remittance getRemittance(Remittance remittance);
	
	List<Remittance> getRemittanceListByUser(User user);
	
	List<Remittance> getRemittanceList(RemittanceParam param);
	
	void updateRemittance(Remittance remittance);
	
	void addRemittance(Remittance remittance);
}
