package local.air;

import java.io.File;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import brut.apktool.Main;
import brut.common.BrutException;

public class AirUnZip {

	public static String[] getIconfile(String targetDir) {
		String manifestFilepath = targetDir + "" + File.separator + "AndroidManifest.xml";
		String iconFile[] = new String[2];
		try {
			File file = new File(manifestFilepath);
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			factory.setIgnoringElementContentWhitespace(true);
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document xmldoc = builder.parse(file);
			Element root = xmldoc.getDocumentElement();
			NodeList nodeList = root.getElementsByTagName("application");
			for (int i=0,length=nodeList.getLength(); i<length; i++) {
				Node node = nodeList.item(i);
				NamedNodeMap attributes = node.getAttributes();
				String icon = attributes.getNamedItem("android:icon").getTextContent();
				if (null != icon) {
					iconFile[1] = icon.substring(1, icon.indexOf("/"));
					if (icon.indexOf("/") > 0) {
						icon = icon.substring(icon.indexOf("/") + 1);
					}
					iconFile[0] = icon + ".png";
					break;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return iconFile;
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
			String[] result = getIconfile(targetDir);
			String[] iconfilepath = getfilepaths(targetDir, result[0]);
			File iconDirfile = new File(iconDir + File.separator + saveDir);
			if (!iconDirfile.exists()) {
				iconDirfile.mkdir();
			}
			AutoCopyFiles copyFiles = new AutoCopyFiles();
			Matcher m = null;
			Pattern p = Pattern.compile("/"+result[1]+"\\S+");
			for (int i = 0; i < iconfilepath.length; i++) {
				m = p.matcher(iconfilepath[i]);
				if (m.find()) {
					String iconFilePath = i + "_" + result[0];
					iconFilePath = m.group(0).substring(1).replace("/", "#");
					copyFiles.copyFile(iconfilepath[i], iconDirfile.getAbsolutePath() + File.separator + iconFilePath);
				}
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