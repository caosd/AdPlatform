package com.stomato.helper;

import java.io.BufferedInputStream;
import java.io.IOException;

import org.apache.log4j.Logger;

public class AirHelper {

	static Logger logger = Logger.getLogger(AirHelper.class);
	
	public static String air(String contextPath, String apkPath) {
		try { 
			String cmd = String.format("java -jar %sWEB-INF/scripts/Air.jar %s", contextPath, apkPath);
			logger.info("run cmd: " + cmd);
			Process pro = Runtime.getRuntime().exec(cmd);
			pro.waitFor(); 
			if (pro.exitValue() != 0) {
				System.out.println("run cmd exception...");
				return null;
			}
			BufferedInputStream br = new BufferedInputStream(pro.getInputStream()); 
			int ch; 
			String packageName = "";
			while((ch = br.read())!= -1){ 
				if ( ch == 10 ) {
					break;
				}
				packageName += (char)ch;
			}
			logger.info("package is " + packageName);
			return packageName;
		} catch (IOException e) { 
			e.printStackTrace(); 
		}catch (InterruptedException e2) { 
			e2.printStackTrace(); 
		} 
		return null;
	}
}
