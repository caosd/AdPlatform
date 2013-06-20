package com.cn.web;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.cn.dto.AdResourceDTO;
import com.cn.model.AdResource;
import com.cn.service.AdResourceService;
import com.cn.util.CustomizedPropertyPlaceholderConfigurer;
import com.cn.util.DateUtil;
import com.cn.util.StringUtil;
import com.cn.vo.SysConfig;

@Controller
@RequestMapping(value="/adResource")
public class AdResourceController {
	
	private Logger logger = Logger.getLogger(AdResourceController.class);
	
	@Autowired
	private AdResourceService adResourceService ;

	/**
	 * goto 下载资源录入页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html")
	public String resourceFromPage(){
		return "adResourceForm";
	}
	
	/**
	 * 查找下载资源
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getAdResource.html")
	public String getAdResource(int id,HttpServletRequest request){
		AdResource adResource = adResourceService.getAdResource(AdResourceDTO.getSql, new Object[]{id});
		request.setAttribute("adResource", adResource);
		return "adResourceUpdate";
	}
	
	/**
	 * 展示下载资源信息
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/showAdResource.html")
	public String showAdResource(int id,HttpServletRequest request){
		AdResource adResource = adResourceService.getAdResource(AdResourceDTO.getSql, new Object[]{id});
		request.setAttribute("adResource", adResource);
		return "adResourceShow";
	}
	
	/**
	 * 下载资源列表
	 * @param adResource
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/adResourceList.html")
	public String adResourceList(AdResource adResource,HttpServletRequest request) throws ParseException{
		
		List<Object> listSqlParams = new ArrayList<Object>();
		
		List<Integer> paramTypes = new ArrayList<Integer>();
		
		String listTotalSql = AdResourceDTO.getListSql(AdResourceDTO.listTotalSql,adResource,0,true,listSqlParams,paramTypes);
		
		int total = adResourceService.listTotal(listTotalSql,listSqlParams.toArray(), SysConfig.list2int(paramTypes));
		
		int pageTotal = SysConfig.getPageTotal(total, adResource.getPageSize());
		
		if(pageTotal<adResource.getPageNum()){
			adResource.setPageNum(1);
		}
		
		int start = (adResource.getPageNum()-1)*adResource.getPageSize();
		String listsql = AdResourceDTO.getListSql(AdResourceDTO.listSql,adResource,start,false,listSqlParams,paramTypes);
		
		List<AdResource> adResourceList = adResourceService.listAdResource(listsql, listSqlParams.toArray(),SysConfig.list2int(paramTypes),start);
		
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("adResource", adResource);
		request.setAttribute("adResourceList", adResourceList);
		
		return "adResourceList";
	}
	
	/**
	 * 添加下载资源
	 * @param adResource
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(method=RequestMethod.POST,value="/addAdResource.html")
	public String addAdResource(AdResource adResource,HttpServletRequest request) throws IOException, ParseException{
		
		String path = request.getSession().getServletContext().getContextPath();
		StringBuffer showpath = new StringBuffer(SysConfig.showpath).append(path.trim());
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
		if(adResource.getStartTime()==0){
			adResource.setStartTime(DateUtil.getDateInt(null));
		}
		if(adResource.getEndTime()==0){
			adResource.setEndTime(DateUtil.getDateInt(DateUtil.getMonth(1)));
		}
		
		if(adResource.getStartTime()>adResource.getEndTime()){
			logger.debug("有效开始日期不能大于结束日期！");
			request.setAttribute("content", "有效开始日期不能大于结束日期！");
			return "msg/error";
		}
		
		/**
		 * ad package & name 应用包 & 包名
		 */
		
		String adPackageName = adResource.getAdPackage().trim();
		if(StringUtil.isEmpty(adPackageName)){
			logger.debug("应用包名不能为空！");
			request.setAttribute("content", "应用包名不能为空！");
			return "msg/error";
		}
		String adPackageDirPath ="/"+adPackageName+"-"+DateUtil.getDateStr(DateUtil.dtShort);
		File adPackageDir = new File(realPath+adPackageDirPath);
        if(!adPackageDir.exists()){
        	adPackageDir.mkdir();
        }		
		
        MultipartFile adPackageFile = adResource.getAdPackageFile();
        if(adPackageFile.isEmpty()){
        	logger.debug("应用包不能为空！");
			request.setAttribute("content", "应用包不能为空！");
			return "msg/error";
        }else{
        	adResource.setFileSize(adPackageFile.getSize()/1024);
        	String newname = adPackageName+StringUtil.getSuffix(adPackageFile.getOriginalFilename());
        	FileUtils.copyInputStreamToFile(adPackageFile.getInputStream(), new File(realPath+adPackageDirPath, newname));
			adResource.setApkUrl(showpath.toString()+adPackageDirPath+"/"+newname);
        }
        
		/**
		 * ad icon
		 */
		MultipartFile adIcon = adResource.getAdIconFile();
		if(adIcon.isEmpty()){
			adResource.setAdIcon("");
		}else{
			String adIconDirPath = adPackageDirPath+"/icon";
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdir();
			}
		//	String newname = "icon"+StringUtil.getSuffix(adIcon.getOriginalFilename());
			String newname = DateUtil.getDateStr(DateUtil.dtLong)+StringUtil.getSuffix(adIcon.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResource.setAdIcon(showpath.toString()+adIconDirPath+"/"+newname);
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
		MultipartFile adImagea = adResource.getAdImagea();
		MultipartFile adImageb = adResource.getAdImageb();
		MultipartFile adImagec = adResource.getAdImagec();
		MultipartFile adImaged = adResource.getAdImaged();
		String newname = "";
		if(!adImagea.isEmpty()){
			newname = DateUtil.getDateStr(DateUtil.dtLong)+"a"+StringUtil.getSuffix(adImagea.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagea.getInputStream(), new File(realPath+adImagesDirPath, newname));
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImageb.isEmpty()){
			newname = DateUtil.getDateStr(DateUtil.dtLong)+"b"+StringUtil.getSuffix(adImageb.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImageb.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImagec.isEmpty()){
			newname = DateUtil.getDateStr(DateUtil.dtLong)+"c"+StringUtil.getSuffix(adImagec.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagec.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImaged.isEmpty()){
			newname = DateUtil.getDateStr(DateUtil.dtLong)+"d"+StringUtil.getSuffix(adImaged.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImaged.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		
		adResource.setAdImages(adImages.toString());
		adResource.setStatus(0);
		adResourceService.addAdResource(AdResourceDTO.addSql, AdResourceDTO.getAddSqlParams(adResource),AdResourceDTO.addSqlParamTypes);
		request.setAttribute("content", "新增下载资源信息成功!");
		return "msg/success";
	}
	
	/**
	 * 修改下载资源
	 * @param adResource
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/updateAdResource.html")
	public String adResourceUpdate(AdResource adResource,HttpServletRequest request) throws ParseException, IOException{
		
		String path = request.getSession().getServletContext().getContextPath();
		StringBuffer showpath = new StringBuffer((String)CustomizedPropertyPlaceholderConfigurer.getContextProperty("address")).append(path.trim());
		showpath.append("/upload");
		/**
		 * 上传文件路径
		 */
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		
		AdResource oldAdResource = adResourceService.getAdResource(AdResourceDTO.getSql, new Object[]{adResource.getId()});
		
		/**
		 * 有效日期
		 */
		if(adResource.getStartTime()==0){
			adResource.setStartTime(DateUtil.getDateInt(null));
		}
		if(adResource.getEndTime()==0){
			logger.debug("有效结束日期不能为空！");
			request.setAttribute("content", "有效结束日期不能为空！");
			return "msg/error";
		}
		
		if(adResource.getStartTime()>adResource.getEndTime()){
			logger.debug("有效开始日期不能大于结束日期！");
			request.setAttribute("content", "有效开始日期不能大于结束日期！");
			return "msg/error";
		}
		
		/**
		 * ad package & name 应用包 & 包名
		 */
		
		String adPackageName = adResource.getAdPackage().trim();
		if(StringUtil.isEmpty(adPackageName)){
			logger.debug("应用包名不能为空！");
			request.setAttribute("content", "应用包名不能为空！");
			return "msg/error";
		}
		String adPackageDirPath = "";
		if(!adPackageName.equals(oldAdResource.getAdPackage())){
			adPackageDirPath ="/"+adPackageName+"-"+DateUtil.getDateStr(DateUtil.dtShort);
			File adPackageDir = new File(realPath+adPackageDirPath);
	        if(!adPackageDir.exists()){
	        	adPackageDir.mkdir();
	        }
	        String oldAdPackageDirPath = "/"+oldAdResource.getAdPackage()+"-"+DateUtil.getDateStr(DateUtil.dtShort,oldAdResource.getItime());
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
	        oldAdResource.setItime(new Date());
		}else{
			adPackageDirPath = "/"+oldAdResource.getAdPackage()+"-"+DateUtil.getDateStr(DateUtil.dtShort,oldAdResource.getItime());
		}
		
		MultipartFile adPackageFile = adResource.getAdPackageFile();
        if(adPackageFile.isEmpty()){
        	adResource.setFileSize(oldAdResource.getFileSize());
        	adResource.setApkUrl(oldAdResource.getApkUrl());
        }else{
        	adResource.setFileSize(adPackageFile.getSize()/1024);
        	String newname = adPackageName+StringUtil.getSuffix(adPackageFile.getOriginalFilename());
        	FileUtils.copyInputStreamToFile(adPackageFile.getInputStream(), new File(realPath+adPackageDirPath, newname));
			adResource.setApkUrl(showpath.toString()+adPackageDirPath+"/"+newname);
        }
        
        /**
		 * ad icon
		 */
		MultipartFile adIcon = adResource.getAdIconFile();
		if(adIcon.isEmpty()){
			adResource.setAdIcon(oldAdResource.getAdIcon());
		}else{
			String adIconDirPath = adPackageDirPath+"/icon";
			File adIconDir = new File(realPath+adIconDirPath);
			if(!adIconDir.exists()){
				adIconDir.mkdir();
			}
	//		String newname = "icon"+StringUtil.getSuffix(adIcon.getOriginalFilename());
			String newname = DateUtil.getDateStr(DateUtil.dtLong)+StringUtil.getSuffix(adIcon.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adIcon.getInputStream(), new File(realPath+adIconDirPath, newname));
			adResource.setAdIcon(showpath.toString()+adIconDirPath+"/"+newname);
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
		MultipartFile adImagea = adResource.getAdImagea();
		MultipartFile adImageb = adResource.getAdImageb();
		MultipartFile adImagec = adResource.getAdImagec();
		MultipartFile adImaged = adResource.getAdImaged();
		String newname = "" ;
		if(!adImagea.isEmpty()){
			newname = DateUtil.getDateStr(DateUtil.dtLong)+"a"+StringUtil.getSuffix(adImagea.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagea.getInputStream(), new File(realPath+adImagesDirPath, newname));
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImageb.isEmpty()){
			newname = DateUtil.getDateStr(DateUtil.dtLong)+"b"+StringUtil.getSuffix(adImageb.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImageb.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImagec.isEmpty()){
			newname = DateUtil.getDateStr(DateUtil.dtLong)+"c"+StringUtil.getSuffix(adImagec.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImagec.getInputStream(), new File(realPath+adImagesDirPath, newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		if(!adImaged.isEmpty()){
			newname = DateUtil.getDateStr(DateUtil.dtLong)+"d"+StringUtil.getSuffix(adImaged.getOriginalFilename());
			FileUtils.copyInputStreamToFile(adImaged.getInputStream(), new File(realPath+adImagesDirPath,newname));
			if(adImages.length()>1){
				adImages.append(",");
			}
			adImages.append(showpath.toString()).append(adImagesDirPath).append("/").append(newname);
		}
		
		if(adImages.length()>1){
			adResource.setAdImages(adImages.toString());
		}else{
			adResource.setAdImages(oldAdResource.getAdImages());
		}
		
		adResource.setItime(oldAdResource.getItime());
		
		adResourceService.updateAdResource(AdResourceDTO.updateSql, AdResourceDTO.getUpdateSqlParams(adResource), AdResourceDTO.updateSqlParamTypes);
		
		request.setAttribute("content", "修改信息成功!");
		
		return "msg/success";
	}
}
