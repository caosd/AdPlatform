package com.stomato.domain;


public class AdPush {
	private Integer id;

	private Integer adresourceId;

	private Boolean topPush;

	private Integer maxPush;

	private Integer dailyPush;

	private Integer totalPush;

	private Integer todayPush;
	
	private Boolean status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Integer getAdresourceId() {
		return adresourceId;
	}

	public void setAdresourceId(Integer adresourceId) {
		this.adresourceId = adresourceId;
	}

	public Boolean getTopPush() {
		return topPush;
	}

	public void setTopPush(Boolean topPush) {
		this.topPush = topPush;
	}

	public Integer getMaxPush() {
		return maxPush;
	}

	public void setMaxPush(Integer maxPush) {
		this.maxPush = maxPush;
	}

	public Integer getDailyPush() {
		return dailyPush;
	}

	public void setDailyPush(Integer dailyPush) {
		this.dailyPush = dailyPush;
	}

	public Integer getTotalPush() {
		return totalPush;
	}

	public void setTotalPush(Integer totalPush) {
		this.totalPush = totalPush;
	}

	public Integer getTodayPush() {
		return todayPush;
	}

	public void setTodayPush(Integer todayPush) {
		this.todayPush = todayPush;
	}

}
