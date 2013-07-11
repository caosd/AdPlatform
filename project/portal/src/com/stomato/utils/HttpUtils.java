package com.stomato.utils;

import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.log4j.Logger;

public class HttpUtils {
	
	private static Logger logger = Logger.getLogger(HttpUtils.class.getName());
	
	private static final String charset = "utf-8";

	//private ThreadLocal<HttpURLConnection> connectionThradLocal = new ThreadLocal<HttpURLConnection>();
	
	public static String post(String path, String params) {
		try {
			URL url = new URL(path);
			
			byte[] data = params.getBytes(charset);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			conn.setUseCaches(false);
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Connection", "Keep-Alive");
			conn.setRequestProperty("Charset", charset);
			conn.setRequestProperty("Content-Length", String.valueOf(data.length));
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			DataOutputStream outStream = new DataOutputStream(conn.getOutputStream());
			outStream.write(data);
			outStream.flush();
			InputStream in = conn.getInputStream();
			StringBuffer sb = new StringBuffer();
			InputStreamReader reader = new InputStreamReader(in, charset);
			char[] buff = new char[1024];
			int len;
			while ((len = reader.read(buff)) > 0) {
				sb.append(buff, 0, len);
			}
			if (conn.getResponseCode() == 200) {
				if (!sb.toString().equals("")) {
					return sb.toString();
				}
			}
		} catch (Exception e) {
			logger.error("post error:" + e.getMessage());
		}
		return null;
	}
	
}
