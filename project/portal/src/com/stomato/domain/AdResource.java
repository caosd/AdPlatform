package com.stomato.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.stomato.utils.StringUtils;

/**
 * 下载资源录入
 * 
 * @author zyf
 * 
 */
public class AdResource {

	private int id;

	/**
	 * 渠道ID
	 */
	private int channelId;
	/**
	 * 下载资源名称
	 */
	private String adName;

	/**
	 * 广告标题
	 */
	private String adTitle;

	/**
	 * 广告图标地址
	 */
	private String adIcon;
	private String adBanner;
	/**
	 * 桌面图片
	 */
	private String desktopIcon;
	/**
	 * 应用图片列表
	 */
	private String adImages;
	/**
	 * 应用包名
	 */
	private String adPackage;
	/**
	 * 应用文件大小
	 */
	private Double fileSize;
	/**
	 * 应用版本
	 */
	private String version;
	/**
	 * 应用支持平台
	 */
	private String supportPlatform;
	/**
	 * 应用分类编号ID
	 */
	private Integer appTypeId;
	/**
	 * 收费类型，0=免费，1=收费
	 */
	private Integer chargeType;
	/**
	 * 0=横屏，1=竖屏
	 */
	private Integer displayPosition;
	/**
	 * 单价
	 */
	private Double price;
	/**
	 * 结算方式
	 */
	private String clearingForm;
	/**
	 * 应用被下载次数
	 */
	private Integer downloads;
	/**
	 * 应用被推荐数
	 */
	private Integer recommens;
	/**
	 * 应用推荐等级
	 */
	private Integer adRating;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 语言
	 */
	private String language;

	private Date modifyDate;

	private Date createDate;

	private String apkUrl;

	private Date startTime;
	private Date endTime;
	/**
	 * 上架时间
	 */
	private Date shelfDate;

	private Integer status;
	private Boolean isDel;
	private Boolean recom;

	/**
	 * 展示需要
	 */

	private String adTypeStr;

	private List<String> adImagesList;

	public String getAdTypeStr() {
		// adTypeStr = SysConfig.getAdType(adType);
		return adTypeStr;
	}

	public List<String> getAdImagesList() {
		List<String> list = new ArrayList<String>();
		if (StringUtils.isEmpty(this.adImages)) {
			adImagesList = null;
		} else {
			String[] strs = this.adImages.split(",");
			for (String str : strs) {
				list.add(str);
			}
			adImagesList = list;
		}
		return adImagesList;
	}

	public Integer getDisplayPosition() {
		return displayPosition;
	}

	public void setDisplayPosition(Integer displayPosition) {
		this.displayPosition = displayPosition;
	}

	public void setFileSize(Double fileSize) {
		this.fileSize = fileSize;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getChannelId() {
		return channelId;
	}

	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public String getAdTitle() {
		return adTitle;
	}

	public Date getShelfDate() {
		return shelfDate;
	}

	public void setShelfDate(Date shelfDate) {
		this.shelfDate = shelfDate;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}

	public Boolean getRecom() {
		return recom;
	}

	public void setRecom(Boolean recom) {
		this.recom = recom;
	}

	public String getAdIcon() {
		return adIcon;
	}

	public void setAdIcon(String adIcon) {
		this.adIcon = adIcon;
	}

	public String getAdBanner() {
		return adBanner;
	}

	public void setAdBanner(String adBanner) {
		this.adBanner = adBanner;
	}

	public String getDesktopIcon() {
		return desktopIcon;
	}

	public void setDesktopIcon(String desktopIcon) {
		this.desktopIcon = desktopIcon;
	}

	public String getAdImages() {
		return adImages;
	}

	public void setAdImages(String adImages) {
		this.adImages = adImages;
	}

	public Double getFileSize() {
		return fileSize;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getSupportPlatform() {
		return supportPlatform;
	}

	public void setSupportPlatform(String supportPlatform) {
		this.supportPlatform = supportPlatform;
	}

	public Integer getChargeType() {
		return chargeType;
	}

	public void setChargeType(Integer chargeType) {
		this.chargeType = chargeType;
	}

	public Integer getDownloads() {
		return downloads;
	}

	public void setDownloads(Integer downloads) {
		this.downloads = downloads;
	}

	public Integer getRecommens() {
		return recommens;
	}

	public void setRecommens(Integer recommens) {
		this.recommens = recommens;
	}

	public String getAdPackage() {
		return adPackage;
	}

	public void setAdPackage(String adPackage) {
		this.adPackage = adPackage;
	}

	public Integer getAppTypeId() {
		return appTypeId;
	}

	public void setAppTypeId(Integer appTypeId) {
		this.appTypeId = appTypeId;
	}

	public Integer getAdRating() {
		return adRating;
	}

	public void setAdRating(Integer adRating) {
		this.adRating = adRating;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getApkUrl() {
		return apkUrl;
	}

	public void setApkUrl(String apkUrl) {
		this.apkUrl = apkUrl;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}

	public void setAdTypeStr(String adTypeStr) {
		this.adTypeStr = adTypeStr;
	}

	public void setAdImagesList(List<String> adImagesList) {
		this.adImagesList = adImagesList;
	}

	public String getClearingForm() {
		return clearingForm;
	}

	public void setClearingForm(String clearingForm) {
		this.clearingForm = clearingForm;
	}

}
