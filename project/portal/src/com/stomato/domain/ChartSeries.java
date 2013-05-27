package com.stomato.domain;

import java.util.List;

import com.google.gson.Gson;

public class ChartSeries {
	private String name;
	
	private List<Object> data;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Object> getData() {
		return data;
	}

	public void setData(List<Object> data) {
		this.data = data;
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}
