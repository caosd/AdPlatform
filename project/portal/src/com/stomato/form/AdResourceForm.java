package com.stomato.form;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.BeanUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.stomato.domain.AdResource;

public class AdResourceForm{
private int id ;
	
	/**
	 * 下载资源名称
	 */
	@NotEmpty
	private String adName ;
	
	/**
	 * 广告语文字
	 */
	@NotEmpty
	private String adText ;
	
	/**
	 * 广告图标地址
	 */
	@NotEmpty
	private String adIcon ;
	
	/**
	 * 广告积分
	 */
	private int adPoint ;
	
	/**
	 * 应用描述
	 */
	@NotEmpty
	private String description;
	
	/**
	 * 应用版本
	 */
	@NotEmpty
	private String version;
	
	/**
	 * 安装包大小(KB)
	 */
	@NotEmpty
	private long fileSize ;
	
	/**
	 * 应用包名
	 */
	@NotEmpty
	private String adPackage ;
	
	/**
	 * 应用图片组(a.jpg,c.jpg,b.jpg) 地址
	 */
	private String adImages ;
	
	/**
	 * 广告类型
	 */
	private int adType ;
	
	/**
	 * apk 下载地址
	 */
	@NotEmpty
	private String apkUrl ;
	
	/**
	 * 开始时间
	 */
	private int startTime ;
	
	/**
	 * 结束时间
	 */
	private int endTime ;
	
	/**
	 * 广告修时间
	 */
	private Date modifyDate ;
	
	/**
	 * 创建时间
	 */
	private Date itime ;
	
	private Integer status;

	/*************************************************************************
	 * 
	 * 非持久化对象
	 * 
	 ************************************************************************/
	
	private MultipartFile adIconFile;
	
	private MultipartFile adPackageFile;
	
	/**
	 * 应用图片组(a.jpg,c.jpg,b.jpg)
	 */
	private MultipartFile adImagea;
	
	private MultipartFile adImageb;
	
	private MultipartFile adImagec;
	
	private MultipartFile adImaged;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public String getAdText() {
		return adText;
	}

	public void setAdText(String adText) {
		this.adText = adText;
	}

	public String getAdIcon() {
		return adIcon;
	}

	public void setAdIcon(String adIcon) {
		this.adIcon = adIcon;
	}

	public int getAdPoint() {
		return adPoint;
	}

	public void setAdPoint(int adPoint) {
		this.adPoint = adPoint;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getAdPackage() {
		return adPackage;
	}

	public void setAdPackage(String adPackage) {
		this.adPackage = adPackage;
	}

	public String getAdImages() {
		return adImages;
	}

	public void setAdImages(String adImages) {
		this.adImages = adImages;
	}

	public int getAdType() {
		return adType;
	}

	public void setAdType(int adType) {
		this.adType = adType;
	}

	public String getApkUrl() {
		return apkUrl;
	}

	public void setApkUrl(String apkUrl) {
		this.apkUrl = apkUrl;
	}

	public int getStartTime() {
		return startTime;
	}

	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}

	public int getEndTime() {
		return endTime;
	}

	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getItime() {
		return itime;
	}

	public void setItime(Date itime) {
		this.itime = itime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public MultipartFile getAdIconFile() {
		return adIconFile;
	}

	public void setAdIconFile(MultipartFile adIconFile) {
		this.adIconFile = adIconFile;
	}

	public MultipartFile getAdPackageFile() {
		return adPackageFile;
	}

	public void setAdPackageFile(MultipartFile adPackageFile) {
		this.adPackageFile = adPackageFile;
	}

	public MultipartFile getAdImagea() {
		return adImagea;
	}

	public void setAdImagea(MultipartFile adImagea) {
		this.adImagea = adImagea;
	}

	public MultipartFile getAdImageb() {
		return adImageb;
	}

	public void setAdImageb(MultipartFile adImageb) {
		this.adImageb = adImageb;
	}

	public MultipartFile getAdImagec() {
		return adImagec;
	}

	public void setAdImagec(MultipartFile adImagec) {
		this.adImagec = adImagec;
	}

	public MultipartFile getAdImaged() {
		return adImaged;
	}

	public void setAdImaged(MultipartFile adImaged) {
		this.adImaged = adImaged;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
	public AdResource asPojo() {
		AdResource adResource = new AdResource();
		BeanUtils.copyProperties(this, adResource);
		return adResource;
	}
}