package com.stomato.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.stomato.constant.Constant;
import com.stomato.domain.AdChannel;
import com.stomato.domain.AdResource;
import com.stomato.domain.AppCategory;
import com.stomato.domain.User;
import com.stomato.exception.DaoException;
import com.stomato.exception.ServiceException;
import com.stomato.form.AdResourceForm;
import com.stomato.form.AdResourceFormParam;
import com.stomato.service.AdChannelService;
import com.stomato.service.AdResourceService;
import com.stomato.service.AppCategoryService;
import com.stomato.service.ConfigService;
import com.stomato.service.PublicService;
import com.stomato.utils.DateUtils;
import com.stomato.utils.ExcelUtils;
import com.stomato.utils.StringUtils;
import com.stomato.validator.AdResourceValidation;

@Controller
@RequestMapping(value="/adresource")
public class AdResourceController extends UserController{

	private Logger log = Logger.getLogger(AdResourceController.class);
	@Autowired
	private AdResourceService adResourceService ;
	@Autowired
	private ConfigService configService;
	@Autowired
	private AppCategoryService appTypeService ;
	@Autowired
	private AdChannelService adChannelService ;
	@Autowired
	private PublicService publicService;

	/**
	 * goto 下载资源录入页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.GET)
	public String fromPage(@ModelAttribute("adResourceForm") AdResourceForm adResourceForm,Model model){
		List<AppCategory> appTypeList = appTypeService.getListFillSun();
		List<AdChannel> adChannerlList = adChannelService.listAdChannel(null);
		model.addAttribute("appTypeList", appTypeList);
		model.addAttribute("adChannerlList", adChannerlList);
		return "portal/adresouce/adresource_form";
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
		
		List<AppCategory> appTypeList = appTypeService.getListFillSun();
		List<AdChannel> adChannerlList = adChannelService.listAdChannel(null);
		model.addAttribute("appTypeList", appTypeList);
		model.addAttribute("adChannerlList", adChannerlList);
		
		AdResourceValidation validation = new AdResourceValidation();
		validation.validate(adResourceForm, result);
		
		if( result.hasErrors() ){
			return "portal/adresouce/adresource_form";
		}
		String path = request.getSession().getServletContext().getContextPath();
		StringBuffer showpath = new StringBuffer(configService.loadConfig(Constant.Configs.filesDirPath)).append(path.trim());
		User user = this.lookup(request);
		/**
		 * 上传文件路径
		 */
		String realPath = configService.loadConfig(Constant.Configs.filesDirPath)+"/upload";
		File uploadDir = new File(realPath);
		if(!uploadDir.exists()){
			uploadDir.mkdirs();
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
			request.setAttribute("msg", "有效开始日期不能大于结束日期！");
			return "portal/adresouce/adresource_form";
		}
		/**
		 * ad package & name 应用包 & 包名
		 */
		String adPackageDirPath = File.separator+user.getUid()+File.separator+Constant.Configs.adresourceDirPath+File.separator+DateUtils.getDateStr(DateUtils.patternB);
		File adPackageDir = new File(realPath+adPackageDirPath);
        if(!adPackageDir.exists()){
        	adPackageDir.mkdirs();
        }		
        /**
		 *  apkFile
		 */
		MultipartFile apkFile = adResourceForm.getApkFile();
		if(apkFile == null || apkFile.isEmpty()){
			adResourceForm.setApkUrl("");
		}else{
			String apkDirPath = adPackageDirPath+File.separator+Constant.Configs.apkDirPath;
			File apkDir = new File(realPath+apkDirPath);
			if(!apkDir.exists()){
				apkDir.mkdirs();
			}
			String newname = StringUtils.getUUID()+StringUtils.getSuffix(apkFile.getOriginalFilename());
			FileUtils.copyInputStreamToFile(apkFile.getInputStream(), new File(realPath+apkDirPath, newname));
			adResourceForm.setApkUrl(showpath.toString()+apkDirPath+File.separator+newname);
		}
		/**
		 * ad icon
		 */
		MultipartFile adIcon = adResourceForm.getAdIconFile();
		if(adIcon.isEmpty()){
			adResourceForm.setAdIcon("");
		}else{
			String adIconDirPath = adPackageDirPath+File.separator+Constant.Configs.appIconDir;
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdirs();
			}
			String newname = StringUtils.getUUID()+StringUtils.getSuffix(adIcon.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setAdIcon(showpath.toString()+adIconDirPath+"/"+newname);
		}
		/**
		 * Banner icon
		 */
		MultipartFile adBannerFile = adResourceForm.getAdBannerFile();
		if(adBannerFile.isEmpty()){
			adResourceForm.setAdBanner("");
		}else{
			String adIconDirPath = adPackageDirPath+File.separator+ Constant.Configs.appIconDir;
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdirs();
			}
			String newname = StringUtils.getUUID()+StringUtils.getSuffix(adBannerFile.getOriginalFilename());
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
			String adIconDirPath = adPackageDirPath+File.separator+ Constant.Configs.appIconDir;
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdirs();
			}
			String newname = StringUtils.getUUID()+StringUtils.getSuffix(desktopIconFile.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setDesktopIcon(showpath.toString()+adIconDirPath+"/"+newname);
		}
		/**
		 * 应用图片组(a.jpg,c.jpg,b.jpg)
		 */
		String adImagesDirPath = adPackageDirPath+"/images";
		File adImagesDir = new File(realPath+adImagesDirPath);
		if(!adImagesDir.exists()){
			adImagesDir.mkdirs();
		}
		StringBuffer adImages = new StringBuffer("") ;
		MultipartFile adImagea = adResourceForm.getAdImagea();
		MultipartFile adImageb = adResourceForm.getAdImageb();
		MultipartFile adImagec = adResourceForm.getAdImagec();
		MultipartFile adImaged = adResourceForm.getAdImaged();
		String newname = "";
		if(!adImagea.isEmpty()){
			newname = StringUtils.getUUID()+"a"+StringUtils.getSuffix(adImagea.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagea.getInputStream(), new File(realPath+adImagesDirPath, newname));
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImageb.isEmpty()){
			newname = StringUtils.getUUID()+"b"+StringUtils.getSuffix(adImageb.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImageb.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImagec.isEmpty()){
			newname = StringUtils.getUUID()+"c"+StringUtils.getSuffix(adImagec.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagec.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImaged.isEmpty()){
			newname = StringUtils.getUUID()+"d"+StringUtils.getSuffix(adImaged.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImaged.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		adResourceForm.setAdImages(adImages.toString());
		AdResource adResource = adResourceForm.asPojo();
		adResource.setStatus(Constant.AdResourceStatus.offShelf);
		adResourceService.addAdResource(adResource);
		//清空表单
		BeanUtils.copyProperties(new AdResourceForm(), adResourceForm);
		model.addAttribute("success", true);
		return "portal/adresouce/adresource_form";
	}
	
	/**
	 * 查找下载资源
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/{id}/edit.html")
	public String preEdit(@PathVariable int id,@ModelAttribute("adResourceForm")AdResourceForm adResourceForm,Model model){
		AdResource adResource = adResourceService.getAdResource(id);
		List<AppCategory> appTypeList = appTypeService.getListFillSun();
		List<AdChannel> adChannerlList = adChannelService.listAdChannel(null);
		model.addAttribute("appTypeList", appTypeList);
		model.addAttribute("adChannerlList", adChannerlList);
		model.addAttribute("adResource", adResource);
		return "portal/adresouce/adresource_edit";
	}
	
	/**
	 * 下载资源列表
	 * @param adResource
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws ServiceException 
	 */
	@RequestMapping(value="/list.html")
	public String list(@ModelAttribute("formParam")AdResourceFormParam formParam,BindingResult result,HttpServletRequest request){
		try {
			int total = adResourceService.listTotal(formParam);
			formParam.setTotalCount(total);
			List<AdResource> adResourceList = adResourceService.listAdResource(formParam);
			
			AdChannel adChannel = new AdChannel();
			adChannel.setEnable(true);
			List<AdChannel> adChannelList = publicService.queryForListEntity("com.stomato.dao.AdChannelDao.queryAdChannelList",AdChannel.class,adChannel);

			request.setAttribute("adResourceList", adResourceList);
			request.setAttribute("adChannelList", adChannelList);
			request.setAttribute("appTypeList", appTypeService.listCategory(null));
		} catch (Exception err) {
			log.error("查询数据库失败", err);
		}
		return "portal/adresouce/adresource_list";
	}
	/**
	 * 修改下载资源
	 * @param adResource
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/{id}/edit.html",method=RequestMethod.POST)
	public String doEdit(@PathVariable int id,@Valid @ModelAttribute("adResourceForm")AdResourceForm adResourceForm, BindingResult result,HttpServletRequest request,Model model) throws IOException, ParseException{
		String path = request.getSession().getServletContext().getContextPath();
		StringBuffer showpath = new StringBuffer(configService.loadConfig(Constant.Configs.filesDirPath)).append(path.trim());
		showpath.append("/upload");
		/**
		 * 上传文件路径
		 */
		String realPath = configService.loadConfig(Constant.Configs.filesDirPath)+File.separator+"upload";
		AdResource oldAdResource = adResourceService.getAdResource(id);
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
			request.setAttribute("msg", "有效开始日期不能大于结束日期！");
			return "portal/adresouce/adresource_edit";
		}
		/**
		 * ad package & name 应用包 & 包名
		 */
		User user = this.lookup(request);
		String adPackageDirPath = File.separator+user.getUid()+File.separator+Constant.Configs.adresourceDirPath+File.separator+DateUtils.getDateStr(DateUtils.patternB,oldAdResource.getCreateDate());
		/**
		 *  apkFile
		 */
		MultipartFile apkFile = adResourceForm.getApkFile();
		if(apkFile == null || apkFile.isEmpty()){
			adResourceForm.setApkUrl(oldAdResource.getApkUrl());
		}else{
			if( null != oldAdResource.getApkUrl() ){
				com.stomato.utils.FileUtils.delete(new File(oldAdResource.getApkUrl()));
			}
			String apkDirPath = adPackageDirPath+File.separator+Constant.Configs.apkDirPath;
			File apkDir = new File(realPath+apkDirPath);
			if(!apkDir.exists()){
				apkDir.mkdirs();
			}
			String newname = StringUtils.getUUID()+StringUtils.getSuffix(apkFile.getOriginalFilename());
			FileUtils.copyInputStreamToFile(apkFile.getInputStream(), new File(realPath+apkDirPath, newname));
			adResourceForm.setApkUrl(showpath.toString()+apkDirPath+File.separator+newname);
		}
        /**
		 * ad icon
		 */
		MultipartFile adBannerFile = adResourceForm.getAdBannerFile();
		if(adBannerFile.isEmpty()){
			adResourceForm.setAdBanner(oldAdResource.getAdBanner());
		}else{
			com.stomato.utils.FileUtils.delete(new File(oldAdResource.getAdBanner()));
			String adIconDirPath = adPackageDirPath+File.separator+Constant.Configs.appIconDir;
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdirs();
			}
			String newname = StringUtils.getUUID()+StringUtils.getSuffix(adBannerFile.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adBannerFile.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setAdBanner(showpath.toString()+adIconDirPath+File.separator+newname);
		}
        /**
		 * ad icon
		 */
		MultipartFile adIcon = adResourceForm.getAdIconFile();
		if(adIcon.isEmpty()){
			adResourceForm.setAdIcon(oldAdResource.getAdIcon());
		}else{
			com.stomato.utils.FileUtils.delete(new File(oldAdResource.getAdIcon()));
			String adIconDirPath = adPackageDirPath+File.separator+Constant.Configs.appIconDir;
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdirs();
			}
	//		String newname = "icon"+StringUtils.getSuffix(adIcon.getOriginalFilename());
			String newname = StringUtils.getUUID()+StringUtils.getSuffix(adIcon.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setAdIcon(showpath.toString()+adIconDirPath+File.separator+newname);
		}
		/**
		 * ad desktopIcon
		 */
		MultipartFile desktopIconFile = adResourceForm.getDesktopIconFile();
		if(desktopIconFile.isEmpty()){
			adResourceForm.setDesktopIcon(oldAdResource.getDesktopIcon());
		}else{
			com.stomato.utils.FileUtils.delete(new File(oldAdResource.getDesktopIcon()));
			String adIconDirPath = adPackageDirPath+File.separator+Constant.Configs.appIconDir;
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdirs();
			}
			String newname = StringUtils.getUUID()+StringUtils.getSuffix(desktopIconFile.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResourceForm.setDesktopIcon(showpath.toString()+adIconDirPath+File.separator+newname);
		}
		/**
		 * 应用图片组(a.jpg,c.jpg,b.jpg)
		 */
		String adImagesDirPath = adPackageDirPath+File.separator+"images";
		File adImagesDir = new File(realPath+adImagesDirPath);
		if(!adImagesDir.exists()){
			adImagesDir.mkdirs();
		}
		StringBuffer adImages = new StringBuffer("") ;
		MultipartFile adImagea = adResourceForm.getAdImagea();
		MultipartFile adImageb = adResourceForm.getAdImageb();
		MultipartFile adImagec = adResourceForm.getAdImagec();
		MultipartFile adImaged = adResourceForm.getAdImaged();
		String newname = "" ;
		if(!adImagea.isEmpty()){
			newname = StringUtils.getUUID()+"a"+StringUtils.getSuffix(adImagea.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagea.getInputStream(), new File(realPath+adImagesDirPath, newname));
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImageb.isEmpty()){
			newname = StringUtils.getUUID()+"b"+StringUtils.getSuffix(adImageb.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImageb.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImagec.isEmpty()){
			newname = StringUtils.getUUID()+"c"+StringUtils.getSuffix(adImagec.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagec.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImaged.isEmpty()){
			newname = StringUtils.getUUID()+"d"+StringUtils.getSuffix(adImaged.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImaged.getInputStream(), new File(realPath+adImagesDirPath,newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(adImages.length()>1){
			//删除已存在图片
			if( null != oldAdResource.getAdImages() ){
				String []images = oldAdResource.getAdImages().split(",");
				for (int i = 0,j = images.length; i < j; i++) {
					com.stomato.utils.FileUtils.delete(new File(images[i]));
				}
			}
			adResourceForm.setAdImages(adImages.toString());
		}else{
			adResourceForm.setAdImages(oldAdResource.getAdImages());
		}
		AdResource adResource = adResourceForm.asPojo();
		adResourceService.updateAdResource(adResource);
		request.setAttribute("success", true);
		return preEdit(id,adResourceForm, model);
	}
	
	@RequestMapping("/{id}/onshelf.html")
	public String onShelfAdResource(@PathVariable int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( Constant.AdResourceStatus.onShelf != resource.getStatus() ){
			resource.setStatus(Constant.AdResourceStatus.onShelf);
			resource.setShelfDate(new Date());
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adresource/list.html";
	}
	@RequestMapping("/{id}/offshelf.html")
	public String offShelfAdResource(@PathVariable int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( Constant.AdResourceStatus.offShelf != resource.getStatus() ){
			resource.setStatus(Constant.AdResourceStatus.offShelf);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adresource/list.html";
	}
	@RequestMapping("/{id}/recomm.html")
	public String recommAdResource(@PathVariable int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( !resource.getIsRecom() ){
			resource.setIsRecom(true);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adresource/list.html";
	}
	@RequestMapping("/{id}/cancelrecomm.html")
	public String cancelRecommAdResource(@PathVariable int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( resource.getIsRecom() ){
			resource.setIsRecom(false);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adresource/list.html";
	}
	@RequestMapping("/{id}/delete.html")
	public String deleteAdResource(@PathVariable int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( !resource.getIsDel() ){
			resource.setIsDel(true);
			resource.setStatus(Constant.AdResourceStatus.offShelf);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adresource/list.html";
	}
	/**
	 * 查询回收站列表
	 * @param model
	 * @return
	 * @throws DaoException 
	 * @throws ServiceException 
	 */
	@RequestMapping(value="/recycle/list.html")
	public String recycleList(@ModelAttribute("formParam")AdResourceFormParam formParam,BindingResult result,HttpServletRequest request) throws ServiceException, DaoException{
		formParam.setIsDel(true);
		int total = adResourceService.listTotal(formParam);
		formParam.setTotalCount(total);
		
		AdChannel adChannel = new AdChannel();
		adChannel.setEnable(true);
		List<AdChannel> adChannelList = publicService.queryForListEntity("com.stomato.dao.AdChannelDao.queryAdChannelList",AdChannel.class,adChannel);
		List<AdResource> adResourceList = adResourceService.listAdResource(formParam);
		
		request.setAttribute("adChannelList", adChannelList);
		request.setAttribute("appTypeList", appTypeService.listCategory(null));
		request.setAttribute("adResourceList", adResourceList);
		return "portal/adresouce/adresource_recyclelist";
	}
	@RequestMapping("/{id}/recover.html")
	public String recoverAdResource(@PathVariable int id,Model model){
		AdResource resource = adResourceService.getAdResource(id);
		if( resource.getIsDel() ){
			resource.setIsDel(false);
			adResourceService.updateAdResource(resource);
		}
		return "redirect:/adresource/recycle/list.html";
	}
	
	@RequestMapping(value="/export-excel")
	public void exportExcel(@ModelAttribute("formParam") AdResourceFormParam formParam,BindingResult result,HttpServletRequest request,HttpServletResponse response){
		int total = adResourceService.listTotal(formParam);
		formParam.setTotalCount(total);
		List<AdResource> adResourceList = adResourceService.listAdResource(formParam);

		Map<String,Object> beans = new HashMap<String,Object>();
		beans.put("adResourceList", adResourceList);
		beans.put("formParam", formParam);
		String tempFile = request.getSession().getServletContext().getRealPath("/")+"WEB-INF/report/template/adresource_report.xls";
		ExcelUtils.export2Excel("广告资源报表",tempFile, beans, response);
	}
}