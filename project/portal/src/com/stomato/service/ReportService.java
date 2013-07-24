package com.stomato.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.ReportDao;
import com.stomato.domain.FormParam;

@Service
public class ReportService {
	
	@Autowired
	private ReportDao reportDao;
	
	public List<Map<String,Object>> getHourlyReport(FormParam param) {
		return this.reportDao.getSummaryReport(param);
	}

	public List<Map<String,Object>>  getAccountsReport(FormParam param) {
		return this.reportDao.getAccountsReport(param);
	}
	
	public List<Map<String,Object>> getDailyReport(FormParam param) {
		return this.reportDao.getDailyReport(param);
	}
	
	public int getDailyReportCount(FormParam param) {
		return this.reportDao.getDailyReportCount(param);
	}
	
	public int getMonthlyReportCount(FormParam param) {
		return this.reportDao.getMonthlyReportCount(param);
	}
	public List<Map<String,Object>> getMonthlyReport(FormParam param) {
		return this.reportDao.getMonthlyReport(param);
	}
	
	public List<Map<String, Object>> getSummaryReport(FormParam param) {
		return this.reportDao.getSummaryReport(param);
	}
}
