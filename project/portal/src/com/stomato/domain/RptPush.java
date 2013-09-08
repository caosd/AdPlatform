package com.stomato.domain;

public class RptPush {

	private Integer id;
	// 日期
	private Integer idate;
	// 广告id
	private Integer adId;
	// 推送数
	private Integer push;
	// 到达数
	private Integer arrive;
	// 点击
	private Integer click;
	// 下载
	private Integer download;
	// 安装
	private Integer install;
	// 收入
	private Double revenue;
	// 下载失败
	private Integer fail;
	// 下载成功
	private Integer downloadSuccess;
	// 展示数
	private Integer shows;

	private Integer active;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIdate() {
		return idate;
	}

	public void setIdate(Integer idate) {
		this.idate = idate;
	}

	public Integer getAdId() {
		return adId;
	}

	public void setAdId(Integer adId) {
		this.adId = adId;
	}

	public Integer getPush() {
		return push;
	}

	public void setPush(Integer push) {
		this.push = push;
	}

	public Integer getArrive() {
		return arrive;
	}

	public void setArrive(Integer arrive) {
		this.arrive = arrive;
	}

	public Integer getClick() {
		return click;
	}

	public void setClick(Integer click) {
		this.click = click;
	}

	public Integer getDownload() {
		return download;
	}

	public void setDownload(Integer download) {
		this.download = download;
	}

	public Integer getInstall() {
		return install;
	}

	public void setInstall(Integer install) {
		this.install = install;
	}

	public Double getRevenue() {
		return revenue;
	}

	public void setRevenue(Double revenue) {
		this.revenue = revenue;
	}

	public Integer getFail() {
		return fail;
	}

	public void setFail(Integer fail) {
		this.fail = fail;
	}

	public Integer getDownloadSuccess() {
		return downloadSuccess;
	}

	public void setDownloadSuccess(Integer downloadSuccess) {
		this.downloadSuccess = downloadSuccess;
	}

	public Integer getShows() {
		return shows;
	}

	public void setShows(Integer shows) {
		this.shows = shows;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

}
