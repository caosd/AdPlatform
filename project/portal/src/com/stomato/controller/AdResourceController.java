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
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.stomato.constant.Constant;
import com.stomato.domain.AdChannel;
import com.stomato.domain.AdResource;
import com.stomato.domain.AppType;
import com.stomato.domain.BaseParam;
import com.stomato.form.AdResourceForm;
import com.stomato.service.AdChannelService;
import com.stomato.service.AdResourceService;
import com.stomato.service.AppTypeService;
import com.stomato.service.ConfigService;
import com.stomato.utils.DateUtils;
import com.stomato.utils.StringUtils;

@Controller
@RequestMapping(value="/adResource")
public class AdResourceController {

	private Logger logger = Logger.getLogger(AdResourceController.class);
	@Autowired
	private AdResourceService adResourceService ;
	@Autowired
	private ConfigService configService;	
	@Autowired
	private AppTypeService appTypeService ;
	@Autowired
	private AdChannelService adChannelService ;

	/**
	 * goto 下载资源录入页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.GET)
	public String resourceFromPage(@ModelAttribute("adResourceForm") AdResourceForm adResourceForm,Model model){
		List<AppType> appTypeList = appTypeService.getListFillSun();
		List<AdChannel> adChannerlList = adChannelService.listAdChannel(null);
		model.addAttribute("appTypeList", appTypeList);
		model.addAttribute("adChannerlList", adChannerlList);
		return "portal/adresouce/adResourceForm";
	}

	/**
	 * 添加下载资源
	 * @param adResource
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.POST)
	public String addAdResource(@Valid @ModelAttribute("adResourceForm")AdResourceForm adResourceForm, BindingResult result,HttpServletRequest request,Model model) throws IOException, ParseException{
		
		List<AppType> appTypeList = appTypeService.getListFillSun();
		List<AdChannel> adChannerlList = adChannelService.listAdChannel(null);
		model.addAttribute("appTypeList", appTypeList);
		model.addAttribute("adChannerlList", adChannerlList);
		
		if( result.hasErrors() ){
			return "portal/adresouce/adResourceForm";
		}
		String path = request.getSession().getServletContext().getContextPath();
		StringBuffer showpath = new StringBuffer(configService.loadConfig(Constant.Configs.filesDirPath)).append(path.trim());
		
		/*String savefilepath = String.format("/%s/%s/%s_%s_%s.%s", adResourceForm.getChannelId(),Constant.Configs.adresourceDirPath,adResourceForm.getAppTypeId(),credentialsNo,photoname,suffix);
		File targetFile = new File((configService.loadConfig(Constant.Configs.filesDirPath) + savefilepath).replace("/", fileSeparator));*/
		/**
		 * 上传文件路径
		 */
		String realPath = request.getSession().getServletContext().getRealPath(configService.loadConfig(Constant.Configs.filesDirPath)+"/upload");
		File uploadDir = new File(realPath);
		if(!uploadDir.exists()){
			uploadDir.mkdir();
		}
		showpath.append("/upload");
		/**
		 * 有效日期
		 */
		if(adResourceForm.getStartTime()==null){
			adResourceForm.setStartTime(DateUtils.getDateUTC());
		}
		if(adResourceForm.getEndTime()==null){
			adResourceForm.setEndTime(DateUtils.getMonth(DateUtils.month +1));
		}
		if(adResourceForm.getStartTime().getTime()>adResourceForm.getEndTime().getTime()){
			logger.debug("有效开始日期不能大于结束日期！");
			request.setAttribute("content", "有效开始日期不能大于结束日期！");
			return "portal/adresouce/adResourceForm";
		}
		/**
		 * ad package & name 应用包 & 包名
		 */
		String adPackageName = adResourceForm.getAdPackage().trim();
		if(StringUtils.isEmpty(adPackageName)){
			logger.debug("推送消息栏图片不能为空！");
			request.setAttribute("content", "推送消息栏图片不能为空！");
			return "portal/adresouce/adResourceForm";
		}
		String adPackageDirPath ="/"+adPackageName+"-"+DateUtils.getDateStr(DateUtils.patternB);
		File adPackageDir = new File(realPath+adPackageDirPath);
        if(!adPackageDir.exists()){
        	adPackageDir.mkdir();
        }		
        
		/**
		 * ad icon
		 */
		MultipartFile adIcon = adResourceForm.getAdIconFile();
		if(adIcon.isEmpty()){
			adResourceForm.setAdIcon("");
		}else{
			String adIconDirPath = adPackageDirPath+"/icon";
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdir();
			}
		//	String newname = "icon"+StringUtil.getSuffix(adIcon.getOriginalFilename());
			String newname = DateUtils.getDateStr(DateUtils.patternB)+StringUtils.getSuffix(adIcon.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setAdIcon(showpath.toString()+adIconDirPath+"/"+newname);
		}
		/**
		 * ad icon
		 */
		MultipartFile adBannerFile = adResourceForm.getAdBannerFile();
		if(adBannerFile.isEmpty()){
			adResourceForm.setAdBanner("");
		}else{
			String adIconDirPath = adPackageDirPath+"/icon";
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdir();
			}
		//	String newname = "icon"+StringUtil.getSuffix(adIcon.getOriginalFilename());
			String newname = DateUtils.getDateStr(DateUtils.patternB)+StringUtils.getSuffix(adBannerFile.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adBannerFile.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setAdBanner(showpath.toString()+adIconDirPath+"/"+newname);
		}
		/**
		 * ad desktopIcon
		 */
		MultipartFile desktopIconFile = adResourceForm.getDesktopIconFile();
		if(desktopIconFile.isEmpty()){
			adResourceForm.setDesktopIcon("");
		}else{
			String adIconDirPath = adPackageDirPath+"/icon";
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdir();
			}
			String newname = DateUtils.getDateStr(DateUtils.patternB)+StringUtils.getSuffix(desktopIconFile.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setDesktopIcon(showpath.toString()+adIconDirPath+"/"+newname);
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
		MultipartFile adImagea = adResourceForm.getAdImagea();
		MultipartFile adImageb = adResourceForm.getAdImageb();
		MultipartFile adImagec = adResourceForm.getAdImagec();
		MultipartFile adImaged = adResourceForm.getAdImaged();
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
		adResourceForm.setAdImages(adImages.toString());
		adResourceForm.setStatus(1);
		AdResource adResource = adResourceForm.asPojo();
		adResource.setStatus(Constant.AdResourceStatus.offShelf);
		adResourceService.addAdResource(adResource);
		//清空表单
		BeanUtils.copyProperties(new AdResourceForm(), adResourceForm);
		model.addAttribute("success", true);
		return "portal/adresouce/adResourceForm";
	}
	
	/**
	 * 查找下载资源
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateAdResource.html")
	public String getAdResource(@ModelAttribute("adResourceForm")AdResourceForm adResourceForm,int id,Model model){
		AdResource adResource = adResourceService.getAdResource(id);
		List<AppType> appTypeList = appTypeService.getListFillSun();
		List<AdChannel> adChannerlList = adChannelService.listAdChannel(null);
		model.addAttribute("appTypeList", appTypeList);
		model.addAttribute("adChannerlList", adChannerlList);
		model.addAttribute("adResource", adResource);
		return "portal/adresouce/adResourceUpdate";
	}
	
	/**
	 * 展示下载资源信息
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/showAdResource.html")
	public String showAdResource(int id,HttpServletRequest request){
		AdResource adResource = adResourceService.getAdResource(id);
		request.setAttribute("adResource", adResource);
		return "portal/adresouce/adResourceShow";
	}
	
	/**
	 * 下载资源列表
	 * @param adResource
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/adResourceList.html")
	public String adResourceList(@ModelAttribute("adResource")AdResource adResource,BindingResult result,HttpServletRequest request) throws ParseException{
		int total = adResourceService.listTotal(adResource);
		BaseParam baseParam = new BaseParam(request,total);
		baseParam.setParam(adResource);
		
		List<AdResource> adResourceList = adResourceService.listAdResource(baseParam);
		
		AdChannel adChannel = new AdChannel();
		adChannel.setEnable(true);
		BaseParam adChannelParame = new BaseParam();
		adChannelParame.setParam(adChannel);
		List<AdChannel> adChannelList = adChannelService.listAdChannel(adChannelParame);
		request.setAttribute("adResourceList", adResourceList);
		request.setAttribute("adChannelList", adChannelList);
		request.setAttribute("appTypeList", appTypeService.listAppType(null));
		request.setAttribute("pageBean", baseParam);
		return "portal/adresouce/adResourceList";
	}
	/**
	 * 修改下载资源
	 * @param adResource
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/updateAdResource.html",method=RequestMethod.POST)
	public String adResourceUpdate(@Valid @ModelAttribute("adResourceForm")AdResourceForm adResourceForm, BindingResult result,HttpServletRequest request,Model model) throws IOException, ParseException{
		String path = request.getSession().getServletContext().getContextPath();
		StringBuffer showpath = new StringBuffer(configService.loadConfig(Constant.Configs.filesDirPath)).append(path.trim());
		showpath.append("/upload");
		/**
		 * 上传文件路径
		 */
		String realPath = request.getSession().getServletContext().getRealPath(configService.loadConfig(Constant.Configs.filesDirPath)+"/upload");
		AdResource oldAdResource = adResourceService.getAdResource(adResourceForm.getId());
		/**
		 * 有效日期
		 */
		if(adResourceForm.getStartTime()==null){
			adResourceForm.setStartTime(oldAdResource.getStartTime());
		}
		if(adResourceForm.getEndTime()==null){
			adResourceForm.setEndTime(oldAdResource.getEndTime());
		}
		if(adResourceForm.getStartTime().getTime()>adResourceForm.getEndTime().getTime()){
			logger.debug("有效开始日期不能大于结束日期！");
			request.setAttribute("content", "有效开始日期不能大于结束日期！");
			return "msg/error";
		}
		/**
		 * ad package & name 应用包 & 包名
		 */
		
		String adPackageName = adResourceForm.getAdPackage().trim();
		if(StringUtils.isEmpty(adPackageName)){
			logger.debug("应用包名不能为空！");
			request.setAttribute("content", "应用包名不能为空！");
			return "msg/error";
		}
		String adPackageDirPath = "";
		if(!adPackageName.equals(oldAdResource.getAdPackage())){
			adPackageDirPath ="/"+adPackageName+"-"+DateUtils.getDateStr(DateUtils.patternB);
			File adPackageDir = new File(realPath+adPackageDirPath);
	        if(!adPackageDir.exists()){
	        	adPackageDir.mkdir();
	        }
	        String oldAdPackageDirPath = "/"+oldAdResource.getAdPackage()+"-"+DateUtils.getDateStr(DateUtils.patternB,oldAdResource.getCreateDate());
	        File oldAdPackageDir = new File(realPath+oldAdPackageDirPath);
	        for(File file:oldAdPackageDir.listFiles()){
	        	if(file.isDirectory()){
	        		FileUtils.moveDirectoryToDirectory(file, adPackageDir, true);
	        	}else{
	        		FileUtils.moveFileToDirectory(file, adPackageDir, false);
	        	}
	        }
	        
	        oldAdPackageDir.delete();
	        
	        oldAdResource.setAdIcon(oldAdResource.getAdIcon().replaceFirst(oldAdResource.getAdPackage(), adPackageName));
	        oldAdResource.setApkUrl(oldAdResource.getApkUrl().replaceFirst(oldAdResource.getAdPackage(), adPackageName));
	        
	        String adImagesArr[] = oldAdResource.getAdImages().split(",");
	        StringBuffer adImages = new StringBuffer("");
	        for(String aa: adImagesArr){
	        	aa.replaceFirst(oldAdResource.getAdPackage(), adPackageName);
	        	if(adImages.length()>1){
					adImages.append(",");
				}
	        	adImages.append(aa);
	        }
	        oldAdResource.setAdImages(adImages.toString());
	        oldAdResource.setCreateDate(new Date());
		}else{
			adPackageDirPath = "/"+oldAdResource.getAdPackage()+"-"+DateUtils.getDateStr(DateUtils.patternB,oldAdResource.getCreateDate());
		}
        
        /**
		 * ad icon
		 */
		MultipartFile adBannerFile = adResourceForm.getAdBannerFile();
		if(adBannerFile.isEmpty()){
			adResourceForm.setAdBanner(oldAdResource.getAdBanner());
		}else{
			String adIconDirPath = adPackageDirPath+"/icon";
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdir();
			}
			String newname = DateUtils.getDateStr(DateUtils.patternB)+StringUtils.getSuffix(adBannerFile.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adBannerFile.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setAdBanner(showpath.toString()+adIconDirPath+"/"+newname);
		}
        /**
		 * ad icon
		 */
		MultipartFile adIcon = adResourceForm.getAdIconFile();
		if(adIcon.isEmpty()){
			adResourceForm.setAdIcon(oldAdResource.getAdIcon());
		}else{
			String adIconDirPath = adPackageDirPath+"/icon";
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdir();
			}
	//		String newname = "icon"+StringUtils.getSuffix(adIcon.getOriginalFilename());
			String newname = DateUtils.getDateStr(DateUtils.patternF)+StringUtils.getSuffix(adIcon.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setAdIcon(showpath.toString()+adIconDirPath+"/"+newname);
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
		MultipartFile adImagea = adResourceForm.getAdImagea();
		MultipartFile adImageb = adResourceForm.getAdImageb();
		MultipartFile adImagec = adResourceForm.getAdImagec();
		MultipartFile adImaged = adResourceForm.getAdImaged();
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
			adResourceForm.setAdImages(adImages.toString());
		}else{
			adResourceForm.setAdImages(oldAdResource.getAdImages());
		}
		AdResource adResource = adResourceForm.asPojo();
		adResourceService.updateAdResource(adResource);
		request.setAttribute("success", true);
		return getAdResource(adResourceForm, adResourceForm.getId(), model);
	}
	
	@RequestMapping("/onShelf.html")
	public String onShelfAdResource(int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( Constant.AdResourceStatus.onShelf != resource.getStatus() ){
			resource.setStatus(Constant.AdResourceStatus.onShelf);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adResource/adResourceList.html";
	}
	@RequestMapping("/offShelf.html")
	public String offShelfAdResource(int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( Constant.AdResourceStatus.offShelf != resource.getStatus() ){
			resource.setStatus(Constant.AdResourceStatus.offShelf);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adResource/adResourceList.html";
	}
	@RequestMapping("/recomm.html")
	public String recommAdResource(int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( !resource.getRecom() ){
			resource.setRecom(true);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adResource/adResourceList.html";
	}
	@RequestMapping("/cancelRecomm.html")
	public String cancelRecommAdResource(int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( resource.getRecom() ){
			resource.setRecom(false);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adResource/adResourceList.html";
	}
	@RequestMapping("/deleteAdResource.html")
	public String deleteAdResource(int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( !resource.getIsDel() ){
			resource.setIsDel(true);
			resource.setStatus(Constant.AdResourceStatus.offShelf);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adResource/adResourceList.html";
	}
	/**
	 * 查询回收站列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listRecycle.html")
	public String recycleList(@ModelAttribute("adResource")AdResource adResource,BindingResult result,HttpServletRequest request){
		adResource.setIsDel(true);
		int total = adResourceService.listTotal(adResource);
		BaseParam baseParam = new BaseParam(request,total);
		baseParam.setParam(adResource);
		
		AdChannel adChannel = new AdChannel();
		adChannel.setEnable(true);
		BaseParam adChannelParame = new BaseParam();
		adChannelParame.setParam(adChannel);
		List<AdChannel> adChannelList = adChannelService.listAdChannel(adChannelParame);
		List<AdResource> adResourceList = adResourceService.listAdResource(baseParam);
		
		request.setAttribute("adChannelList", adChannelList);
		request.setAttribute("appTypeList", appTypeService.listAppType(null));
		request.setAttribute("adResourceList", adResourceList);
		request.setAttribute("pageBean", baseParam);
		return "portal/adresouce/adResourceRecycleList";
	}
	@RequestMapping("/recover.html")
	public String recoverAdResource(int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( resource.getIsDel() ){
			resource.setIsDel(false);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adResource/listRecycle.html";
	}
}