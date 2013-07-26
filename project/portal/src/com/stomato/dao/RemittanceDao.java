package com.stomato.dao;

import java.util.List;

import com.stomato.domain.FormParam;
import com.stomato.domain.Remittance;

/**
 * 申请汇款dao接口
 * @author  jiandong
 */
public interface RemittanceDao {

	Remittance getRemittance(int id);
	
	List<Remittance> getRemittanceListByApplyStatus(int uid);
	
	List<Remittance> getRemittanceListByUser(FormParam param);
	
	List<Remittance> getRemittanceList(FormParam param);
	
	int getRemittanceCount(FormParam param);
	
	void updateRemittance(Remittance remittance);
	
	void remittanceComplete(int id);
	
	void addRemittance(Remittance remittance);
}
