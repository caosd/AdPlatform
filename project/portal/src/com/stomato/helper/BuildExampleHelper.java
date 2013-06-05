package com.stomato.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.stomato.domain.App;
import com.stomato.utils.FileUtils;
import com.stomato.utils.ZipUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;
/**
 * 创建 apk的example
 * @author xiongbiao
 *
 */
public class BuildExampleHelper {
	
	private static Logger logger = LoggerFactory.getLogger(BuildExampleHelper.class.getName());
	
	/**
	 * 通过模板文件创建 新的文件
	 * @param flieName
	 * @param appId
	 * @param AppKey
	 * @param templateName
	 * @param PackageName
	 * @param tPath
	 * @return
	 */
	private static String CreateFile(String path,String flieName, String appId, String AppKey, String templateName, String PackageName, String tPath) {
		String filePath = "";
		Configuration cfg = new Configuration();
		try {
			cfg.setDirectoryForTemplateLoading(new File(tPath + "/sdktemplate"));
			Template t = cfg.getTemplate(templateName); // 读取文件名为Test.ftl的模板
			t.setEncoding("UTF-8");
			Map<String, String> root = new HashMap<String, String>(); // 存储数据
			root.put("appkey", AppKey);
			root.put("packagename", PackageName);
			File f = new File(tPath + "/sdkexample/" + appId+"/"+path);
			if (f.exists()) {
				logger.debug("文件存在");
			} else {
				logger.debug("文件不存在，正在创建...");
				if (f.mkdirs()) {
					logger.debug("文件创建成功！");
				} else {
					logger.debug("文件创建失败！");
				}

			}
			Writer out = new OutputStreamWriter(new FileOutputStream(tPath + "/sdkexample/" + appId + "/"+ path + flieName), "UTF-8"); // 输出流
			t.process(root, out);
		
			logger.debug("Create  successfully!");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return filePath;
	}

	/**
	 * 创建测试应用
	 * isUpdate 是否更新
	 * @throws Exception
	 * 
	 */
	public static String CreateExample(App app, String webPath, boolean isUpdate, String srcPackageName) throws Exception{
		logger.debug(String.format("begin Create AppID-%s-example……!", app.getId()));
		String appId = app.getId()+"";
		//zip包路径
		String zipPath = "/sdkexample/"+appId+"/sdk.zip";
		logger.debug("项目目录 ： " + webPath);
		File file = new File(webPath+zipPath);
		
		if (file.exists()) {
			if (!isUpdate) {
				logger.debug(String.format(" Create AppID-%s-example……!   appzip exists not update", app.getId()));
				return zipPath;
			}
			else {
				String delePath = webPath+"/sdkexample/"+appId;
				FileUtils.delete(new File(delePath));
			}
		}
		 
		//拷贝母版文件夹
		FileUtils.copy(new File(webPath+"/sdkmastermask"), new File(webPath+"/sdkexample/"+appId));

		//生成AndroidManifest文件 等java文件
		CreateFiles(app, webPath, srcPackageName);
 		
		//打包项目
		ZipUtils.compress(webPath+"/sdkexample/"+appId+"/example", webPath+zipPath);
		
		//删除打包前文件
        
		logger.debug(String.format("end Create AppID-%s-example……!", app.getId()));
		return zipPath;
	}
	
	private static void CreateFiles(App app ,String webPath, String srcPackageName){
		String appId = app.getId()+"";
		String appkey = app.getKey();
		String packagename = app.getPkg();
		
		CreateFile("example/","AndroidManifest.xml", appId, appkey,  "AndroidManifest.ftl", packagename, webPath);
		CreateFile("example/"+srcPackageName,"PushSetActivity.java", appId, appkey,  "PushSetActivity.ftl", packagename, webPath);
		CreateFile("example/"+srcPackageName,"MainActivity.java", appId, appkey,  "MainActivity.ftl", packagename, webPath);
		CreateFile("example/"+srcPackageName,"SettingActivity.java", appId, appkey,  "SettingActivity.ftl", packagename, webPath);
	}

}