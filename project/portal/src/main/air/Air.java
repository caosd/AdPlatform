package main.air;

import java.io.File;
import java.util.Set;

import brut.androlib.AndrolibException;
import brut.androlib.ApkDecoder;
import brut.androlib.res.data.ResPackage;

public class Air {

	public static void main(String[] args) {
		String f = "/Users/dekkerdong/Downloads/Camerahans16.apk";
		ApkDecoder d = new ApkDecoder();
		d.setApkFile(new File(f));
		try {
			Set<ResPackage> p = d.getResTable().listMainPackages();
			for(ResPackage r:p){
				System.out.println("反编译APK后包名：" + r.getName());
			}
		} catch (AndrolibException e) {
			e.printStackTrace();
		}
		Unzip.getIcons(f);
	}

}
