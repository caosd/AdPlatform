package com.stomato.manager.impl;

import org.springframework.stereotype.Component;

import com.stomato.domain.ReportParam;
import com.stomato.manager.ReportEvent;
import com.stomato.manager.ReportManager;

@Component
public class ReportManagerImpl<T> implements ReportManager<T> {

	@Override
	public T generateReport(ReportEvent<T> event, ReportParam param) {
		T ctx = event.lookup(param);
		return event.injectDefaults(ctx, param);
	}

}
