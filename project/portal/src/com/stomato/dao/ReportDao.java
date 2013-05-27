package com.stomato.dao;

import java.util.List;
import java.util.Map;

import com.stomato.domain.ReportParam;
import com.stomato.domain.ReportResult;

public interface ReportDao {
	
	List<ReportResult> getHourlyReport(ReportParam param);
	
	List<ReportResult> getDailyReport(ReportParam param);
	
	List<ReportResult> getMonthlyReport(ReportParam param);
	
	List<Map<String, Object>> getSummaryReport(Map<String, Object> param);
}
