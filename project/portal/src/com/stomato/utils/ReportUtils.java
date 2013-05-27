package com.stomato.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.stomato.domain.ReportResult;

public class ReportUtils {
	
	private static final SimpleDateFormat report_iday_formatter = new SimpleDateFormat("yyyyMMdd");
	
	public static List<long[]> convert(List<ReportResult> results) {
		List<long[]> list = new ArrayList<long[]>();
		if (results != null) {
			ReportResult result = null;
			for (int i=0, len=results.size(); i<len; i++) {
				result = results.get(i);
				list.add(result.toArray());
			}
		}
		return list;
	}
	
	public static String getCurrentIDate() {
		return report_iday_formatter.format(new java.util.Date());
	}
}
