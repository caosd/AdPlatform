package com.stomato.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

public class DateUtils {
	
	private static Logger logger = Logger.getLogger(DateUtils.class.getName());
	
	public static Date parseDate(String dateStr, String pattern) {
		if (StringUtils.isEmpty(dateStr)) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		try {
			return sdf.parse(dateStr);
		} catch (ParseException e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	
}
