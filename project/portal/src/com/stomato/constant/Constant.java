package com.stomato.constant;

public interface Constant {
	
	//系统配置
	interface Configs {
		String credentialsDirPath = "credentials";

		String appsDirPath = "apps";

		String tmpsDirPath = "tmps";
		
		String filesDirPath = "files_path";
		
		String appIconDirSuffix = "Icons";
		
		String appDirSuffix = "Dir";

		String appIconDir = "icon";

	}
	
	//App状态
	interface AppStatus {
		int infoCompleted = 1;
		
		int sdkInstalled = 2;
		
	}
}
