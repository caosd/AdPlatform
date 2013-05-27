package com.stomato.utils;

import java.security.MessageDigest;
import java.util.UUID;

public class StringUtils {
	public static boolean isEmpty(Object obj){
		return obj == null ? true : String.valueOf(obj).trim().length() == 0;
	}
	
	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	private static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
	}
	
	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}
	
	public static String toMD5(String origin) {
		String resultString = null;
		try {
			resultString = new String(origin);
			MessageDigest md = MessageDigest.getInstance("MD5");
			resultString = byteArrayToHexString(md.digest(resultString
					.getBytes()));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultString;
	}
	
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static String getRandomChars(int length) {
		String uuid = getUUID();
		return uuid.substring(8, 8 + length);
	}
	
	public static String convertToUnicode(String str) {
		str = (str == null ? "" : str);
		String tmp;
		StringBuffer sb = new StringBuffer(1000);
		char c;
		int i, j;
		sb.setLength(0); 
		for (i = 0; i < str.length(); i++) {
			c = str.charAt(i);
			sb.append("\\u");
			j = (c >>>8);
			tmp = Integer.toHexString(j);
			if (tmp.length() == 1) sb.append("0");
			sb.append(tmp);
			j = (c & 0xFF);
			tmp = Integer.toHexString(j);
			if (tmp.length() == 1)  sb.append("0");
			sb.append(tmp);
		}
		return sb.toString();
    }
}
