package com.stomato.utils;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FileUtils {

	private static boolean copyFile(File in, File out) {
		FileInputStream fis = null;
		FileOutputStream fos = null;
		FileChannel sourceChannel = null;
		FileChannel targetChannel = null;
		boolean res = true;
		try {
			fis = new FileInputStream(in);
			fos = new FileOutputStream(out);
			sourceChannel = fis.getChannel();
			targetChannel = fos.getChannel();
			sourceChannel.transferTo(0, sourceChannel.size(), targetChannel);
		} catch (Exception e) {
			res = false;
		} finally {
			if (sourceChannel != null) {
				try {
					sourceChannel.close();
				} catch (IOException e) {
					res = false;
				}
			}
			if (targetChannel != null) {
				try {
					targetChannel.close();
				} catch (IOException e) {
					res = false;
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					res = false;
				}
			}
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					res = false;
				}
			}
		}
		return res;
	}

	private static void writeBytes2File(ByteBuffer bb, File out)
			throws Exception {
		FileChannel targetChannel = new FileOutputStream(out).getChannel();
		try {
			targetChannel.write(bb);
		} finally {
			targetChannel.close();
		}
	}

	public static boolean move(File srcFile, File destFile) {
		if (srcFile.renameTo(destFile)) {
			return true;
		}
		return false;
	}

	public static boolean copy(File srcFile, File destFile) {
		if (srcFile.isDirectory()) {
			return false;
		}
		File parentPathFile = destFile.getParentFile();
		if (!parentPathFile.exists()) {
			parentPathFile.mkdirs();
		}
		return copyFile(srcFile, destFile);
	}

	public static void delete(File file) {
		if (file.exists()) {
			if (file.isFile()) {
				file.delete();
			} else if (file.isDirectory()) {
				File files[] = file.listFiles();
				for (int i = 0; i < files.length; i++) {
					delete(files[i]);
				}
			}
			file.delete();
		}
	}

	private static void createParentDirs(File file) {
		File parentPathFile = file.getParentFile();
		if (!parentPathFile.exists()) {
			parentPathFile.mkdirs();
		}
	}

	public static boolean appendBinaryToFile(String path, byte[] data, int pos) {
		return appendBinaryToFile(new File(path), data, pos);
	}

	public static boolean appendBinaryToFile(File file, byte[] data, int pos) {
		createParentDirs(file);
		try {
			RandomAccessFile rfile = new RandomAccessFile(file, "rw");
			if (pos != 0) {
				rfile.seek(file.length());
			} else {
				rfile.seek(0);
			}
			rfile.write(data);
			rfile.close();
			return true;
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public static File binaryToFile(String path, byte[] data) {
		return binaryToFile(new File(path), data);
	}

	public static File binaryToFile(File file, byte[] data) {
		if (data == null) {
			return null;
		}
		if (file.exists()) {
			if (file.isDirectory()) {
				return null;
			}
		} else {
			File dir = file.getParentFile();
			if (dir != null && !dir.exists()) {
				dir.mkdir();
			}
		}

		ByteBuffer bb = ByteBuffer.wrap(data);
		try {
			writeBytes2File(bb, file);
		} catch (Exception e) {
			return null;
		}
		return file;
	}

	public static File string2file(File file, String data) {
		OutputStream os = null;
		try {
			os = new FileOutputStream(file);
			os.write(data.getBytes());
			return file;
		} catch (Exception ex) {
		} finally {
			if (os != null) {
				try {
					os.close();
				} catch (IOException ex) {
				}
			}
		}
		return null;
	}

	public static String getFileName(String filename) {
		if (filename.endsWith("/")) {
			return "";
		}
		int begin = filename.lastIndexOf("/") + 1;
		int end = filename.length();
		filename = filename.substring(begin, end);
		String fileName;
		int index = filename.lastIndexOf(".");
		if (index >= 0) {
			fileName = filename.substring(0, index);
		} else {
			fileName = filename;
		}
		return fileName;
	}

	static public byte[] binaryFromFile(File file) {
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			byte[] fileData = new byte[(int) file.length()];
			// convert file into array of bytes
			fis.read(fileData);
			return fileData;
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException ex) {
				}
			}

		}
		return null;
	}

	static public byte[] binaryFromFile(String path) {
		File f = new File(path);
		if (!f.exists()) {
			System.err.println("File (" + path
					+ ") does not exist, read faild!");
			return null;
		}
		return binaryFromFile(f);
	}

	static public boolean mkdir(String dir) {
		File d = new File(dir);
		if (!d.exists()) {
			return d.mkdirs();
		}
		return true;
	}

	public static String parentDirectoryOfFile(File file) {
		String dir = file.getParent();
		if (dir == null) {
			return "";
		}
		return dir + "/";
	}

	public static String nameOfDir(String dirPath) {
		if (dirPath.endsWith(File.separator)) {
			File f = new File(dirPath);
			return f.getName();
		} else {
			File f = new File(dirPath);
			if (f.exists() && f.isDirectory()) {
				return f.getName();
			} else {
				return null;
			}
		}
	}

	public static String nameOfFile(String filePath) {
		if (filePath.endsWith(File.separator)) {
			return null;
		}
		File f = new File(filePath);
		return f.getName();
	}

	static public File[] subDirectories(File dir) {
		if (!dir.exists() || !dir.isDirectory()) {
			return new File[0];
		}
		return dir.listFiles(new FileFilter() {

			@Override
			public boolean accept(File pathname) {
				return pathname.isDirectory();
			}
		});
	}

	static public File[] subFiles(File dir) {
		if (!dir.exists() || !dir.isDirectory()) {
			return new File[0];
		}
		return dir.listFiles(new FileFilter() {

			@Override
			public boolean accept(File pathname) {
				return !pathname.isDirectory()
						&& !pathname.getName().startsWith(".");
			}
		});
	}

	static public List<File> allSubFiles(File dir) {
		List<File> list = new ArrayList<File>();
		for (File d : subDirectories(dir)) {
			list.addAll(allSubFiles(d));
		}
		list.addAll(Arrays.asList(subFiles(dir)));
		return list;
	}

	public static List<String> listFiles(String dir) {
		List<String> lstFileNames = new ArrayList<String>();
		listFiles(lstFileNames, new File(dir));
		return lstFileNames;
	}

	private static void listFiles(List<String> listFileNames, File file) {
		if (file.isDirectory()) {
			File[] t = file.listFiles();

			for (int i = 0; i < t.length; i++) {
				File f = t[i];
				if (f.isDirectory()) {
					listFileNames.add("[" + f.getName() + "]");
				} else {
					listFileNames.add(f.getName());
				}
			}
		}
	}

	public static byte[] readBytes(String path, long pos, int size) {
		RandomAccessFile file = null;
		try {
			file = new RandomAccessFile(path, "r");
			long fileSize = file.length();
			if (pos >= fileSize) {
				return null;
			}

			if (pos + size > fileSize) {
				size = (int) (fileSize - pos);
			}
			file.seek(pos);
			byte[] buffer = new byte[size];
			file.read(buffer);
			return buffer;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (file != null) {
				try {
					file.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public static boolean appendBytes(String path, byte data[]) {
		RandomAccessFile file = null;
		try {
			file = new RandomAccessFile(path, "rw");
			file.seek(file.length());
			file.write(data);
			file.close();
			return true;
		} catch (IOException e) {
		} finally {
			if (file != null) {
				try {
					file.close();
				} catch (IOException e) {
				}
			}
		}
		return false;
	}
}
