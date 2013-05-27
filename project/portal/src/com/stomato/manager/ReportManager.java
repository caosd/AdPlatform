package com.stomato.manager;

import com.stomato.domain.ReportParam;

public interface ReportManager<T> {
	
	T generateReport(ReportEvent<T> event, ReportParam param);
	
}
