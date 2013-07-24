package com.stomato.dao;

import java.util.List;
import java.util.Map;

import com.stomato.domain.FormParam;

public interface ReportDao {
	
	List<Map<String,Object>>  getHourlyReport(FormParam param);
	
	List<Map<String,Object>>  getAccountsReport(FormParam param);
	
	List<Map<String,Object>>  getDailyReport(FormParam param);
	
	Integer getDailyReportCount(FormParam param);
	
	List<Map<String,Object>>  getMonthlyReport(FormParam param);

	Integer getMonthlyReportCount(FormParam param);
	
	List<Map<String, Object>> getSummaryReport(FormParam param);
}
