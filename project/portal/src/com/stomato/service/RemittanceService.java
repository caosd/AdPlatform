package com.stomato.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.RemittanceDao;
import com.stomato.domain.Remittance;
import com.stomato.domain.RemittanceParam;

/**
 * 申请汇款Service实现类
 * @author  jiandong
 */
@Service
public class RemittanceService {

	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private RemittanceDao remittanceDao;

	public Remittance getRemittance(int id) {
		return this.remittanceDao.getRemittance(id);
	}
	
	public List<Remittance> getRemittanceListByApplyStatus(int uid) {
		return this.remittanceDao.getRemittanceListByApplyStatus(uid);
	}
	
	public List<Remittance> getRemittanceList(RemittanceParam param){
		return this.remittanceDao.getRemittanceList(param);
	}
	
	public List<Remittance> getRemittanceListByUser(RemittanceParam param){
		return this.remittanceDao.getRemittanceListByUser(param);
	}
	
	public int getRemittanceCount(RemittanceParam param){
		return this.remittanceDao.getRemittanceCount(param);
	}
	
	public void updateRemittance(Remittance remittance) {
		this.remittanceDao.updateRemittance(remittance);
	}
	
	public void remittanceComplete(int id) {
		this.remittanceDao.remittanceComplete(id);
	}

	public void addRemittance(Remittance remittance) {
		this.remittanceDao.addRemittance(remittance);
	}
}
