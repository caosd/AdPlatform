package com.stomato.constant;

public interface Constant {
	
	public static final String BUILD_EXAMPLE_ANDROID_PACKAGE = "BUILD_EXAMPLE_ANDROID_PACKAGE";
	public static final String fileSeparator = System.getProperty("file.separator");
	
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
	
	//Credential 证件类型
	interface CredentialsType{
		int identityCard = 1;
		int businessLicense = 2;
	}
}
