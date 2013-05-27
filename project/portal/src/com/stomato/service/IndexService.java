package com.stomato.service;

import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class IndexService {
	
	private static final long startNum = 23012411713L;
	private static final long startStmp = 1352780902052L;
	
	public long getIndexCount() {
		//按每秒增加1111流量计算
		long insValue = (new Date().getTime() - startStmp)/1000 * 1111;
		return startNum + insValue;
	}

}
