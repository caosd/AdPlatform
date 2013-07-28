package local.air;

import java.io.File;
import java.util.Set;

import brut.androlib.ApkDecoder;
import brut.androlib.res.data.ResPackage;

public class Air {

	public static void main(String[] args) throws Exception {
		String f = null;//args[0];
		f = "/Users/dekkerdong/Downloads/3.apk";
		ApkDecoder d = new ApkDecoder();
		d.setApkFile(new File(f));
		String dir = null;
		Set<ResPackage> p = d.getResTable().listMainPackages();
		for (ResPackage r:p) {
			dir = r.getName();
			System.out.println(r.getName());
		}
		if (null != dir) {
			AirUnZip.getIcons(f, dir);
			System.exit(0);
		}
		
		
	}

}
