package com.stomato.helper;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.stomato.domain.App;
import com.stomato.utils.HttpUtils;
import com.stomato.utils.NumberUtils;
import com.stomato.utils.StringUtils;

public class AppHelper {
	
	private static final int SOURCE = 3;
	
	//private static final String syncAppPath = "http://192.168.1.107:28080/kkliaotian.push/ws/saveApp.do";
	
	//private static final String syncPackagePath = "http://192.168.1.107:28080/kkliaotian.push/ws/searchApp.do";
	
	private static final String syncAppPath = "http://iportal.jpush.cn:8080/kkliaotian.push/ws/saveApp.do";
	
	private static final String syncPackagePath = "http://iportal.jpush.cn:8080/kkliaotian.push/ws/searchApp.do";
	
	private static final String imeiToUidPath = "http://183.232.25.111:8090/cgi-bin/getuidbyappidimei.py";
	
	private static final String setTestUidPath = "http://183.232.25.111:8090/cgi-bin/settestuid2.py";
	
	private static final String removeTestUidPath = "http://183.232.25.111:8090/cgi-bin/removetestuid.py";
	
	private static Gson gson = new Gson();
	
	private static Logger logger = Logger.getLogger(AppHelper.class.getName());
	
	@SuppressWarnings("unchecked")
	public static int syncApp(App app) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name_cn", app.getName());
		params.put("pkg", app.getPkg());
		params.put("send_id", "support@stomato.com.cn");
		params.put("app_key", app.getKey());
		params.put("dev_id", app.getUid());
		params.put("is_sync", 1);
		params.put("source", SOURCE);
		params.put("id", app.getId());
		
		String postParams = dumpPostParam(params);
		String remoteData = HttpUtils.post(syncAppPath, postParams);
		if (remoteData != null) {
			Map<String, Object> remoteMap = gson.fromJson(remoteData, Map.class);
			if (remoteMap != null) {
				Object successed = remoteMap.get("success");
				if (successed != null) {
					boolean synSuccessed = Boolean.parseBoolean(successed.toString());
					if (synSuccessed) {
						Map<String, Object> dataMap = (Map<String, Object>)remoteMap.get("result_detail");
						if (dataMap != null) {
							Object appId = dataMap.get("app_id");
							if (appId != null) {
								return (int) Double.parseDouble(String.valueOf(appId));
							}
						}
					} else {
						logger.error("sync App failed: " + remoteData);
					}
				}
			}
		}
		return 0;
	}
	
	@SuppressWarnings("unchecked")
	public static boolean syncPackage(int devId, String pkg) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("package", pkg);
		params.put("dev_id", devId);
		params.put("source", SOURCE);
		
		String postParams = dumpPostParam(params);
		String remoteData = HttpUtils.post(syncPackagePath, postParams);
		if (remoteData != null) {
			Map<String, Object> remoteMap = gson.fromJson(remoteData, Map.class);
			if (remoteMap != null) {
				Object success = remoteMap.get("isExistApp");
				if (success != null) {
					return !Boolean.parseBoolean(success.toString());
				}
			}
		}
		return false;
	}
	
	public static String generateAppKey(String userName) {
		String appKey = userName + new Date().toString() + "34FG10";
		return StringUtils.toMD5(appKey);
	}
	
	private static String dumpPostParam(Map<String, Object> params) {
		StringBuilder builder = new StringBuilder();
		for (String key : params.keySet()) {
			try {
				builder.append(key + "=" + URLEncoder.encode(String.valueOf(params.get(key)), "utf-8") + "&");
			} catch (UnsupportedEncodingException e) {
			}
		}
		return builder.toString();
	}
	
	public long getPushUidByImei(String imei, String pkg) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("appname", pkg);
		params.put("imei", imei);
		
		String postParams = dumpPostParam(params);
		String remoteData = HttpUtils.post(imeiToUidPath, postParams);
		if (remoteData != null) {
			remoteData = remoteData.trim().replaceAll("/n", "").replaceAll("/r", "");
			if (NumberUtils.isNumberic(remoteData)) {
				return Long.parseLong(remoteData);
			}
		}
		return -1;
	}
	
	@SuppressWarnings("unchecked")
	public int startPush(long uid, String pkg) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("testuid3", uid);
		params.put("adid", 999);
		params.put("sdkver", "0.2.4");
		params.put("appname", pkg);
		
		String postParams = dumpPostParam(params);
		String remoteData = HttpUtils.post(setTestUidPath, postParams);
		if (remoteData != null) {
			try {
				Map<String, Object> m = gson.fromJson(remoteData, Map.class);
				if (m != null && m.get("errcode") != null) {
					return (int)Double.parseDouble(m.get("errcode").toString());
				}
			} catch (Exception ex) {
				logger.error(ex.getMessage());
			}
		}
		return -1;
	}
	
	@SuppressWarnings("unchecked")
	public int stopPush(long uid) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("uid", uid);
		
		String postParams = dumpPostParam(params);
		String remoteData = HttpUtils.post(removeTestUidPath, postParams);
		if (remoteData != null) {
			try {
				Map<String, Object> m = gson.fromJson(remoteData, Map.class);
				if (m != null && m.get("errcode") != null) {
					return (int)Double.parseDouble(m.get("errcode").toString());
				}
			} catch (Exception ex) {
				logger.error(ex.getMessage());
			}
		}
		return -1;
	}
	
}
