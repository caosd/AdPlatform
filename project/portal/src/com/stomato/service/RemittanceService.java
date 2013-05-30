package com.stomato.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.RemittanceDao;
import com.stomato.domain.Remittance;

/**
 * 申请汇款Service实现类
 * @author  jiandong
 */
@Service
public class RemittanceService {

	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private RemittanceDao remittanceDao;

	public Remittance getRemittance(Remittance remittance) {
		return this.remittanceDao.getRemittance(remittance);
	}
	
	public List<Remittance> getRemittanceList(int uid){
		return this.remittanceDao.getRemittanceList(uid);
	}

	public void updateRemittance(Remittance remittance) {
		this.remittanceDao.updateRemittance(remittance);
	}

	public void addRemittance(Remittance remittance) {
		this.remittanceDao.addRemittance(remittance);
	}
}
