package com.stomato.vo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SysConfig {
	
	private static Map<Integer,String> statusMap = new HashMap<Integer,String>();
	
	private static Map<Integer,String> adTypeMap = new HashMap<Integer,String>();
	
	static{
		statusMap.put(0, "有效");
		statusMap.put(1, "无效");
		
		adTypeMap.put(0, "热门");
		adTypeMap.put(1, "应用");
		adTypeMap.put(2, "游戏");
	}
	
	public static String getStatus(int status){
		return statusMap.get(status);
	}
	
	public static String getAdType(int adType){
		return adTypeMap.get(adType);
	}
	
	public static int[] list2int(List<Integer> list){
		if(list != null){
			int []paramTypes = new int[list.size()];
			for(int i=0;i<list.size();i++){
				paramTypes[i] = list.get(i);
			}
			return paramTypes ;
		}
		return null;
	}
	
	public static int getPageTotal(int total , int pageSize){
		int pageTotal = total/pageSize;
		if(total%pageSize != 0){
			return pageTotal+1 ;
		}
		return pageTotal ;
	}
}
