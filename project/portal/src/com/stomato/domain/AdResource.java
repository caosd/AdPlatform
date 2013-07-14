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
public class AdResource extends BaseParam {

	private int id;

	/**
	 * 渠道ID
	 */
	private int channelId;
	/**
	 * 下载资源名称
	 */
	private String appName;

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
	private String appPackage;
	/**
	 * 应用文件大小
	 */
	private Integer fileSize;
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
	private Integer appRating;
	/**
	 * 描述
	 */
	private String description;
	private Date modifyDate;

	private Date createDate;

	private String apkUrl;

	private Date startTime;
	private Date endTime;

	private Integer status;
	private Boolean is_del;

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

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getAdTitle() {
		return adTitle;
	}

	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
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

	public String getAppPackage() {
		return appPackage;
	}

	public void setAppPackage(String appPackage) {
		this.appPackage = appPackage;
	}

	public Integer getFileSize() {
		return fileSize;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
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

	public Integer getAppTypeId() {
		return appTypeId;
	}

	public void setAppTypeId(Integer appTypeId) {
		this.appTypeId = appTypeId;
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

	public Integer getAppRating() {
		return appRating;
	}

	public void setAppRating(Integer appRating) {
		this.appRating = appRating;
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

	public Boolean getIs_del() {
		return is_del;
	}

	public void setIs_del(Boolean is_del) {
		this.is_del = is_del;
	}

	public void setAdTypeStr(String adTypeStr) {
		this.adTypeStr = adTypeStr;
	}

	public void setAdImagesList(List<String> adImagesList) {
		this.adImagesList = adImagesList;
	}

	/**
	 * 展示需要
	 */

	private String adTypeStr;

	private List<String> adImagesList;

	public String getAdTypeStr() {
		//adTypeStr = SysConfig.getAdType(adType);
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

}
