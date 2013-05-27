package com.stomato.manager;

import com.stomato.domain.ReportParam;

public interface ReportEvent<T> {
	
	/*
	 * 查找数据
	 */
	T lookup(ReportParam param);

	/*
	 * 注入默认数据
	 */
	T injectDefaults(T t, ReportParam param);
	
}
