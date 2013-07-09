package com.stomato.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.stomato.constant.Constant;
import com.stomato.dao.AdChannelParam;
import com.stomato.domain.AdChannel;
import com.stomato.form.AdChannelForm;
import com.stomato.service.AdResourceService;
import com.stomato.utils.DateUtils;
import com.stomato.utils.StringUtils;
import com.stomato.vo.SysConfig;

@Controller
@RequestMapping(value="/adchannel")
public class AdChannelController {

	private Logger logger = Logger.getLogger(AdChannelController.class);
	@Autowired
	private AdResourceService AdChannelService ;
	/**
	 * goto 进入天津渠道页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.GET)
	public String fromPage(@ModelAttribute("adChannelForm") AdChannelForm adChannelForm){
		return "portal/adchannel/adChannelForm";
	}

	/**
	 * 添加下载资源
	 * @param AdChannel
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.POST)
	public String addAdChannel(@Valid @ModelAttribute("AdChannelForm")AdChannelForm AdChannelForm, BindingResult result,HttpServletRequest request) throws IOException, ParseException{
		
		if( result.hasErrors() ){
			return "portal/adchannel/AdChannelForm";
		}
		String path = request.getSession().getServletContext().getContextPath();
		StringBuffer showpath = new StringBuffer(configService.loadConfig(Constant.Configs.filesDirPath)).append(path.trim());
		/**
		 * 上传文件路径
		 */
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		File uploadDir = new File(realPath);
		if(!uploadDir.exists()){
			uploadDir.mkdir();
		}
		showpath.append("/upload");
		/**
		 * 有效日期
		 */
		if(AdChannelForm.getStartTime()==0){
			AdChannelForm.setStartTime(DateUtils.getDateInt(DateUtils.getDateUTC()));
		}
		if(AdChannelForm.getEndTime()==0){
			AdChannelForm.setEndTime(DateUtils.getDateInt(DateUtils.getMonth(1)));
		}
		if(AdChannelForm.getStartTime()>AdChannelForm.getEndTime()){
			logger.debug("有效开始日期不能大于结束日期！");
			request.setAttribute("content", "有效开始日期不能大于结束日期！");
			return "portal/adchannel/AdChannelForm";
		}
		/**
		 * ad package & name 应用包 & 包名
		 */
		String adPackageName = AdChannelForm.getAdPackage().trim();
		if(StringUtils.isEmpty(adPackageName)){
			logger.debug("应用包名不能为空！");
			request.setAttribute("content", "应用包名不能为空！");
			return "portal/adchannel/AdChannelForm";
		}
		String adPackageDirPath ="/"+adPackageName+"-"+DateUtils.getDateStr(DateUtils.patternB);
		File adPackageDir = new File(realPath+adPackageDirPath);
        if(!adPackageDir.exists()){
        	adPackageDir.mkdir();
        }		
        MultipartFile adPackageFile = AdChannelForm.getAdPackageFile();
        if(adPackageFile.isEmpty()){
        	logger.debug("应用包不能为空！");
			request.setAttribute("content", "应用包不能为空！");
			return "portal/adchannel/AdChannelForm";
        }else{
        	AdChannelForm.setFileSize(adPackageFile.getSize()/1024);
        	String newname = adPackageName+StringUtils.getSuffix(adPackageFile.getOriginalFilename());
        	FileUtils.copyInputStreamToFile(adPackageFile.getInputStream(), new File(realPath+adPackageDirPath, newname));
        	AdChannelForm.setApkUrl(showpath.toString()+adPackageDirPath+"/"+newname);
        }
		/**
		 * ad icon
		 */
		MultipartFile adIcon = AdChannelForm.getAdIconFile();
		if(adIcon.isEmpty()){
			AdChannelForm.setAdIcon("");
		}else{
			String adIconDirPath = adPackageDirPath+"/icon";
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdir();
			}
		//	String newname = "icon"+StringUtil.getSuffix(adIcon.getOriginalFilename());
			String newname = DateUtils.getDateStr(DateUtils.patternB)+StringUtils.getSuffix(adIcon.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			AdChannelForm.setAdIcon(showpath.toString()+adIconDirPath+"/"+newname);
		}
		/**
		 * 应用图片组(a.jpg,c.jpg,b.jpg)
		 */
		String adImagesDirPath = adPackageDirPath+"/images";
		File adImagesDir = new File(realPath+adImagesDirPath);
		if(!adImagesDir.exists()){
			adImagesDir.mkdir();
		}
		StringBuffer adImages = new StringBuffer("") ;
		MultipartFile adImagea = AdChannelForm.getAdImagea();
		MultipartFile adImageb = AdChannelForm.getAdImageb();
		MultipartFile adImagec = AdChannelForm.getAdImagec();
		MultipartFile adImaged = AdChannelForm.getAdImaged();
		String newname = "";
		if(!adImagea.isEmpty()){
			newname = DateUtils.getDateStr(DateUtils.patternF)+"a"+StringUtils.getSuffix(adImagea.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagea.getInputStream(), new File(realPath+adImagesDirPath, newname));
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImageb.isEmpty()){
			newname = DateUtils.getDateStr(DateUtils.patternF)+"b"+StringUtils.getSuffix(adImageb.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImageb.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImagec.isEmpty()){
			newname = DateUtils.getDateStr(DateUtils.patternF)+"c"+StringUtils.getSuffix(adImagec.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagec.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImaged.isEmpty()){
			newname = DateUtils.getDateStr(DateUtils.patternF)+"d"+StringUtils.getSuffix(adImaged.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImaged.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		AdChannelForm.setAdImages(adImages.toString());
		AdChannelForm.setStatus(0);
		AdChannel AdChannel = AdChannelForm.asPojo();
		AdChannelService.addAdChannel(AdChannel);
		request.setAttribute("content", "新增下载资源信息成功!");
		return "portal/adchannel/AdChannelForm";
	}
	
	/**
	 * 查找下载资源
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getAdChannel.html")
	public String getAdChannel(int id,HttpServletRequest request){
		AdChannel AdChannel = AdChannelService.getAdChannel(id);
		request.setAttribute("AdChannel", AdChannel);
		return "portal/adchannel/AdChannelUpdate";
	}
	
	/**
	 * 展示下载资源信息
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/showAdChannel.html")
	public String showAdChannel(int id,HttpServletRequest request){
		AdChannel AdChannel = AdChannelService.getAdChannel(id);
		request.setAttribute("AdChannel", AdChannel);
		return "portal/adchannel/AdChannelShow";
	}
	
	/**
	 * 下载资源列表
	 * @param AdChannel
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/AdChannelList.html")
	public String AdChannelList(@ModelAttribute("AdChannelParamForm")AdChannelParamForm paramForm,BindingResult result,HttpServletRequest request) throws ParseException{
		AdChannelParam param = paramForm.asPojo();
		int total = AdChannelService.listTotal(param);
		int pageTotal = SysConfig.getPageTotal(total, param.getPageSize());
		if(pageTotal < param.getPageNum()){
			param.setPageNum(1);
		}
		int start = (param.getPageNum()-1) * param.getPageSize();
		param.setSlimt(start);
		List<AdChannel> AdChannelList = AdChannelService.listAdChannel(param);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("AdChannelList", AdChannelList);
		request.setAttribute("totalcount", total);
		request.setAttribute("pageNum", param.getPageNum());
		return "portal/adchannel/AdChannelList";
	}
	
	/**
	 * 修改下载资源
	 * @param AdChannel
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/updateAdChannel.html")
	public String AdChannelUpdate(AdChannel AdChannel,HttpServletRequest request) throws ParseException, IOException{
		
		String path = request.getSession().getServletContext().getContextPath();
		StringBuffer showpath = new StringBuffer(configService.loadConfig(Constant.Configs.filesDirPath)).append(path.trim());
		showpath.append("/upload");
		/**
		 * 上传文件路径
		 */
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		AdChannel oldAdChannel = AdChannelService.getAdChannel(AdChannel.getId());
		/**
		 * 有效日期
		 */
		if(AdChannel.getStartTime()==0){
			AdChannel.setStartTime(DateUtils.getDateInt(null));
		}
		if(AdChannel.getEndTime()==0){
			logger.debug("有效结束日期不能为空！");
			request.setAttribute("content", "有效结束日期不能为空！");
			return "msg/error";
		}
		if(AdChannel.getStartTime()>AdChannel.getEndTime()){
			logger.debug("有效开始日期不能大于结束日期！");
			request.setAttribute("content", "有效开始日期不能大于结束日期！");
			return "msg/error";
		}
		/**
		 * ad package & name 应用包 & 包名
		 */
		
		String adPackageName = AdChannel.getAdPackage().trim();
		if(StringUtils.isEmpty(adPackageName)){
			logger.debug("应用包名不能为空！");
			request.setAttribute("content", "应用包名不能为空！");
			return "msg/error";
		}
		String adPackageDirPath = "";
		if(!adPackageName.equals(oldAdChannel.getAdPackage())){
			adPackageDirPath ="/"+adPackageName+"-"+DateUtils.getDateStr(DateUtils.patternB);
			File adPackageDir = new File(realPath+adPackageDirPath);
	        if(!adPackageDir.exists()){
	        	adPackageDir.mkdir();
	        }
	        String oldAdPackageDirPath = "/"+oldAdChannel.getAdPackage()+"-"+DateUtils.getDateStr(DateUtils.patternB,oldAdChannel.getItime());
	        File oldAdPackageDir = new File(realPath+oldAdPackageDirPath);
	        for(File file:oldAdPackageDir.listFiles()){
	        	if(file.isDirectory()){
	        		FileUtils.moveDirectoryToDirectory(file, adPackageDir, true);
	        	}else{
	        		FileUtils.moveFileToDirectory(file, adPackageDir, false);
	        	}
	        }
	        
	        oldAdPackageDir.delete();
	        
	        oldAdChannel.setAdIcon(oldAdChannel.getAdIcon().replaceFirst(oldAdChannel.getAdPackage(), adPackageName));
	        oldAdChannel.setApkUrl(oldAdChannel.getApkUrl().replaceFirst(oldAdChannel.getAdPackage(), adPackageName));
	        
	        String adImagesArr[] = oldAdChannel.getAdImages().split(",");
	        StringBuffer adImages = new StringBuffer("");
	        for(String aa: adImagesArr){
	        	aa.replaceFirst(oldAdChannel.getAdPackage(), adPackageName);
	        	if(adImages.length()>1){
					adImages.append(",");
				}
	        	adImages.append(aa);
	        }
	        oldAdChannel.setAdImages(adImages.toString());
	        oldAdChannel.setItime(new Date());
		}else{
			adPackageDirPath = "/"+oldAdChannel.getAdPackage()+"-"+DateUtils.getDateStr(DateUtils.patternB,oldAdChannel.getItime());
		}
		
		MultipartFile adPackageFile = AdChannel.getAdPackageFile();
        if(adPackageFile.isEmpty()){
        	AdChannel.setFileSize(oldAdChannel.getFileSize());
        	AdChannel.setApkUrl(oldAdChannel.getApkUrl());
        }else{
        	AdChannel.setFileSize(adPackageFile.getSize()/1024);
        	String newname = adPackageName+StringUtils.getSuffix(adPackageFile.getOriginalFilename());
        	FileUtils.copyInputStreamToFile(adPackageFile.getInputStream(), new File(realPath+adPackageDirPath, newname));
			AdChannel.setApkUrl(showpath.toString()+adPackageDirPath+"/"+newname);
        }
        /**
		 * ad icon
		 */
		MultipartFile adIcon = AdChannel.getAdIconFile();
		if(adIcon.isEmpty()){
			AdChannel.setAdIcon(oldAdChannel.getAdIcon());
		}else{
			String adIconDirPath = adPackageDirPath+"/icon";
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdir();
			}
	//		String newname = "icon"+StringUtils.getSuffix(adIcon.getOriginalFilename());
			String newname = DateUtils.getDateStr(DateUtils.patternF)+StringUtils.getSuffix(adIcon.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			AdChannel.setAdIcon(showpath.toString()+adIconDirPath+"/"+newname);
		}
		/**
		 * 应用图片组(a.jpg,c.jpg,b.jpg)
		 */
		String adImagesDirPath = adPackageDirPath+"/images";
		File adImagesDir = new File(realPath+adImagesDirPath);
		if(!adImagesDir.exists()){
			adImagesDir.mkdir();
		}
		StringBuffer adImages = new StringBuffer("") ;
		MultipartFile adImagea = AdChannel.getAdImagea();
		MultipartFile adImageb = AdChannel.getAdImageb();
		MultipartFile adImagec = AdChannel.getAdImagec();
		MultipartFile adImaged = AdChannel.getAdImaged();
		String newname = "" ;
		if(!adImagea.isEmpty()){
			newname = DateUtils.getDateStr(DateUtils.patternF)+"a"+StringUtils.getSuffix(adImagea.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagea.getInputStream(), new File(realPath+adImagesDirPath, newname));
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImageb.isEmpty()){
			newname = DateUtils.getDateStr(DateUtils.patternF)+"b"+StringUtils.getSuffix(adImageb.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImageb.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImagec.isEmpty()){
			newname = DateUtils.getDateStr(DateUtils.patternF)+"c"+StringUtils.getSuffix(adImagec.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagec.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImaged.isEmpty()){
			newname = DateUtils.getDateStr(DateUtils.patternF)+"d"+StringUtils.getSuffix(adImaged.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImaged.getInputStream(), new File(realPath+adImagesDirPath,newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(adImages.length()>1){
			AdChannel.setAdImages(adImages.toString());
		}else{
			AdChannel.setAdImages(oldAdChannel.getAdImages());
		}
		AdChannel.setItime(oldAdChannel.getItime());
		AdChannelService.updateAdChannel(AdChannel);
		request.setAttribute("content", "修改信息成功!");
		return "msg/success";
	}
}