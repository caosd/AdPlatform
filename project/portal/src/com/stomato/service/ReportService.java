package com.stomato.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.ReportDao;
import com.stomato.form.ReportFormParam;

@Service
public class ReportService {
	
	@Autowired
	private ReportDao reportDao;
	
	public List<Map<String,Object>> getHourlyReport(ReportFormParam param) {
		return this.reportDao.getSummaryReport(param);
	}

	public List<Map<String,Object>>  getAccountsReport(ReportFormParam param) {
		return this.reportDao.getAccountsReport(param);
	}
	
	public List<Map<String,Object>> getDailyReport(ReportFormParam param) {
		return this.reportDao.getDailyReport(param);
	}
	
	public int getDailyReportCount(ReportFormParam param) {
		return this.reportDao.getDailyReportCount(param);
	}
	
	public int getMonthlyReportCount(ReportFormParam param) {
		return this.reportDao.getMonthlyReportCount(param);
	}
	public List<Map<String,Object>> getMonthlyReport(ReportFormParam param) {
		return this.reportDao.getMonthlyReport(param);
	}
	
	public List<Map<String, Object>> getSummaryReport(ReportFormParam param) {
		return this.reportDao.getSummaryReport(param);
	}
}
