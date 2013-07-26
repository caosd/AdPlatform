package com.stomato.dao;

import java.util.List;
import java.util.Map;

import com.stomato.form.ReportFormParam;

public interface ReportDao {
	
	List<Map<String,Object>>  getHourlyReport(ReportFormParam param);
	
	List<Map<String,Object>>  getAccountsReport(ReportFormParam param);
	
	List<Map<String,Object>>  getDailyReport(ReportFormParam param);
	
	Integer getDailyReportCount(ReportFormParam param);
	
	List<Map<String,Object>>  getMonthlyReport(ReportFormParam param);

	Integer getMonthlyReportCount(ReportFormParam param);
	
	List<Map<String, Object>> getSummaryReport(ReportFormParam param);
}
