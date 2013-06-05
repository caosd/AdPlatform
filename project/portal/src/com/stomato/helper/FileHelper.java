package com.stomato.helper;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileHelper {

	public static List<String> readFiles(String filepath) throws IOException {
		List<String> files = new ArrayList<String>();
		File f = new File(filepath);
		if (f.exists() && f.isDirectory()) {
			if (f.listFiles().length != 0) {
				File file[] = f.listFiles();
				int i = f.listFiles().length;
				for (int j = 0; j < i; j++) {
					if (file[j].isDirectory()) {
						readFiles(file[j].getAbsolutePath());
					} else {
						files.add(file[j].getAbsolutePath().replace("#", "%23"));
					}
				}
			}
		}
		return files;
	}
}
