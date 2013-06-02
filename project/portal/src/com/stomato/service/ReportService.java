package com.stomato.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.ReportDao;
import com.stomato.domain.ReportParam;

@Service
public class ReportService {
	
	@Autowired
	private ReportDao reportDao;
	
	public List<Map<String,Object>> getHourlyReport(ReportParam param) {
		return this.reportDao.getSummaryReport(param);
	}
	
	public List<Map<String,Object>> getDailyReport(ReportParam param) {
		return this.reportDao.getDailyReport(param);
	}
	
	public List<Map<String,Object>> getMonthlyReport(ReportParam param) {
		return this.reportDao.getMonthlyReport(param);
	}
	
	public List<Map<String, Object>> getSummaryReport(ReportParam param) {
		return this.reportDao.getSummaryReport(param);
	}
}
