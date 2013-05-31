package com.stomato.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.PaymentDao;
import com.stomato.dao.ReportDao;
import com.stomato.dao.TransferDao;
import com.stomato.dao.UserDao;
import com.stomato.domain.Payment;
import com.stomato.domain.ReportParam;
import com.stomato.domain.ReportResult;
import com.stomato.domain.Transfer;
import com.stomato.domain.User;

@Service
public class ReportService {
	
	@Autowired
	private ReportDao reportDao;
	
	public List<ReportResult> getHourlyReport(ReportParam param) {
		return this.reportDao.getHourlyReport(param);
	}
	
	public List<ReportResult> getDailyReport(ReportParam param) {
		return this.reportDao.getDailyReport(param);
	}
	
	public List<ReportResult> getMonthlyReport(ReportParam param) {
		return this.reportDao.getMonthlyReport(param);
	}
	
	public List<Map<String, Object>> getSummaryReport(Map<String, Object> param) {
		return this.reportDao.getSummaryReport(param);
	}
}
