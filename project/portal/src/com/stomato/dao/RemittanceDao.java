package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Remittance;
import com.stomato.form.RemittanceFormParam;

/**
 * 申请汇款dao接口
 * @author  jiandong
 */
public interface RemittanceDao {

	Remittance getRemittance(int id);
	
	List<Remittance> getRemittanceListByApplyStatus(int uid);
	
	List<Remittance> getRemittanceListByUser(RemittanceFormParam param);
	
	List<Remittance> getRemittanceList(RemittanceFormParam param);
	
	int getRemittanceCount(RemittanceFormParam param);
	
	void updateRemittance(Remittance remittance);
	
	void remittanceComplete(int id);
	
	void addRemittance(Remittance remittance);
}
