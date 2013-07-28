package test;

import java.io.BufferedInputStream;
import java.io.IOException;

public class Main {

	public static void main(String[] args) {
		try { 
			Process pro = Runtime.getRuntime().exec("java -jar /Users/dekkerdong/Desktop/Air.jar /Users/dekkerdong/Downloads/GoogleMaps6120.apk");
			pro.waitFor(); 
			if (pro.exitValue() != 0) {
				System.out.println("run cmd exception...");
				return;
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
			System.out.println(packageName);
		} catch (IOException e) { 
			e.printStackTrace(); 
		}catch (InterruptedException e2) { 
			e2.printStackTrace(); 
		} 
	}

}
