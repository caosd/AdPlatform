package local.air;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import brut.apktool.Main;
import brut.common.BrutException;

public class AirUnZip {

	public static String[] getIconfile(String targetDir) {
		String manifestFilepath = targetDir + "" + File.separator
				+ "AndroidManifest.xml";
		String keyLine = "android:icon=";
		String nameLine = "android:label";
		String iconFilePath[] = new String[2];
		try {
			File file = new File(manifestFilepath);
			// BufferedInputStream bin = new BufferedInputStream(new
			// FileInputStream(appDatafilePath));
			// byte[] buff = new byte[(int)file.length()];

			InputStreamReader read = new InputStreamReader(new FileInputStream(
					file), "UTF-8");
			String fileContent = "";
			BufferedReader reader = new BufferedReader(read);
			String lineContent;
			while ((lineContent = reader.readLine()) != null) {
				fileContent = fileContent + lineContent + "\n";
			}
			String[] lines = fileContent.split("\n");
			// bin.read(buff);
			OutputStreamWriter fout = new OutputStreamWriter(
					new FileOutputStream(file), "UTF-8");
			// String str = new String(buff);
			// String[] lines = str.split("\n");
			for (String line : lines) {
				String line_changed = line;
				if (line.contains(keyLine)) {
					int fi = line.indexOf("drawable");
					int end = line.indexOf("\"", fi);
					while (end < fi) {
						end = line.indexOf("\"", end);
					}
					iconFilePath[0] = line.substring(fi + 9, end) + ".png";
				}
				if (line.contains(nameLine)) {
					int fi = line.indexOf("string");
					int end = line.indexOf("\"", fi);
					while (end < fi) {
						end = line.indexOf("\"", end);
					}
					iconFilePath[1] = line.substring(fi + 7, end);
				}
				fout.write(line_changed + "\n");
			}
			fout.flush();
			fout.close();
			reader.close();
			// bin.close();
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		String stringsPath = targetDir + "" + File.separator + "res"
				+ File.separator + "values" + File.separator + "strings.xml";
		try {
			File file = new File(stringsPath);
			InputStreamReader read = new InputStreamReader(new FileInputStream(
					file), "UTF-8");
			String fileContent = "";
			BufferedReader reader = new BufferedReader(read);
			String lineContent;
			while ((lineContent = reader.readLine()) != null) {
				fileContent = fileContent + lineContent + "\n";
			}
			String[] lines = fileContent.split("\n");
			OutputStreamWriter fout = new OutputStreamWriter(
					new FileOutputStream(file), "UTF-8");
			for (String line : lines) {
				String line_changed = line;
				if (line.contains(iconFilePath[1])) {
					int fi = line.indexOf(">");
					int end = line.indexOf("<", fi);
					iconFilePath[1] = line.substring(fi + 1, end);
					break;
				}
				fout.write(line_changed + "\n");
			}
			fout.flush();
			fout.close();
			reader.close();
			// bin.close();
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		return iconFilePath;
	}

	public static String[] getfilepaths(String dir, String searchname) {
		String[] results = findFileInDir(dir, searchname).toString().split(",");
		return results;
	}

	public static StringBuffer findFileInDir(String dir, String searchname) {
		StringBuffer temp = new StringBuffer();
		File root = new File(dir);
		File[] filesOrDirs = root.listFiles();
		if (filesOrDirs == null)
			return temp;

		String[] result = new String[filesOrDirs.length];
		for (int i = 0; i < filesOrDirs.length; i++) {

			if (filesOrDirs[i].isDirectory()) {
				StringBuffer t = findFileInDir(
						filesOrDirs[i].getAbsolutePath(), searchname);
				if (t != null && !t.equals(""))
					temp.append(t);
			} else {
				result[i] = filesOrDirs[i].getName();
				if (result[i].equals(searchname)) {
					temp.append(filesOrDirs[i]);
					temp.append(",");
				}
			}
		}
		return temp;
	}

	private static boolean deleteDir(File dir) {

		if (dir.isDirectory()) {
			String[] children = dir.list();
			for (int i = 0; i < children.length; i++) {
				boolean success = deleteDir(new File(dir, children[i]));
				if (!success) {
					return false;
				}
			}
		}

		// The directory is now empty so now it can be smoked
		return dir.delete();
	}

	public static void getIcons(final String apkfile, String saveDir) {
		try {
			File apkFile = new File(apkfile);
			String fileName = apkFile.getName();
			String path = apkFile.getParent();
			final String targetDir = path + File.separator
					+ fileName.substring(0, fileName.lastIndexOf(".")) + "Dir";
			final String iconDir = path + File.separator
					+ fileName.substring(0, fileName.lastIndexOf(".")) + "Icons";
			File dir = new File(targetDir);
			File iconsdir = new File(iconDir);
			if (dir.exists()) {
				deleteDir(dir);
			}
			if (!iconsdir.exists()) {
				iconsdir.mkdir();
			}
			final String[] argss = new String[] { "d", apkfile, targetDir };
			try {
				Main.main(argss);
			} catch (BrutException e) {
				e.printStackTrace();
			}
			String result[] = getIconfile(targetDir);
			String[] iconfilepath = getfilepaths(targetDir, result[0]);
			File iconDirfile = new File(iconDir + File.separator + saveDir);
			if (!iconDirfile.exists()) {
				iconDirfile.mkdir();
			}
			AutoCopyFiles copyFiles = new AutoCopyFiles();
			Pattern p = Pattern.compile("/drawable\\S+");
			Matcher m = null;
			for (int i = 0; i < iconfilepath.length; i++) {
				m = p.matcher(iconfilepath[i]);
				String iconFilePath = i + "_" + result[0];
				if (m.find()) {
					iconFilePath = m.group(0).substring(1).replace("/", "#");
				}
				copyFiles.copyFile(iconfilepath[i], iconDirfile.getAbsolutePath() + File.separator + iconFilePath);
			}
			// deleteDir(new File(targetDir));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	// 扫描.APK文件
	public static String[] searchApk(String dir, String suf) {
		StringBuffer sb = sApk(dir, suf);
		if (sb.length() == 0)
			return null;
		String[] result = sb.toString().split(",");
		return result;
	}

	public static StringBuffer sApk(String dir, String suf) {
		StringBuffer temp = new StringBuffer();
		File root = new File(dir);
		File[] filesOrDirs = root.listFiles();
		if (filesOrDirs == null)
			return temp;

		String[] result = new String[filesOrDirs.length];
		for (int i = 0; i < filesOrDirs.length; i++) {

			// add by Dengjy @2011-10-26, 把sina/weibo目录从扫描路径中去掉（因为里面有太多的临时文件）
			if (filesOrDirs[i].isDirectory()) {
				StringBuffer t = sApk(filesOrDirs[i].getAbsolutePath(), suf);
				// serachApk(filesOrDirs[i].getAbsolutePath()).append(",");
				// StringBuffer k = (t!=null)?
				// ((!t.equals(""))?t.append(","):null): null;
				if (t != null && !t.equals(""))
					temp.append(t);
			} else {
				result[i] = filesOrDirs[i].getName();
				if ((suf == null) && (!result[i].equals(""))) {
					temp.append(filesOrDirs[i].getAbsolutePath()).append(",");
				} else if (result[i].endsWith(suf)) { // 取与suf匹配后缀的文件名
					temp.append(filesOrDirs[i].getAbsolutePath()).append(",");
				}
			}
		}
		if (temp.length() > 1 && temp.charAt(temp.length() - 2) == ','
				&& temp.charAt(temp.length() - 1) == ',') {
			// LogUtils.e(AppData.tag, "TEMP"+
			// temp.charAt(temp.length()-2)+"         "+
			// temp.charAt(temp.length()-1));
			temp.delete(temp.length() - 2, temp.length() - 1);
		}
		return temp;
	}
}