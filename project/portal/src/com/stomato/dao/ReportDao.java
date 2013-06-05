package com.stomato.dao;

import java.util.List;
import java.util.Map;

import com.stomato.domain.ReportParam;

public interface ReportDao {
	
	List<Map<String,Object>>  getHourlyReport(ReportParam param);
	
	List<Map<String,Object>>  getDailyReport(ReportParam param);
	
	Integer getDailyReportCount(ReportParam param);
	
	List<Map<String,Object>>  getMonthlyReport(ReportParam param);

	Integer getMonthlyReportCount(ReportParam param);
	
	List<Map<String, Object>> getSummaryReport(ReportParam param);
}
