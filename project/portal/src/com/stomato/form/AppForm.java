package com.stomato.form;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.App;

public class AppForm{
	
	private int id;
	
	@NotEmpty
	private String name;
	
	private String pkg;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPkg() {
		return pkg;
	}

	public void setPkg(String pkg) {
		this.pkg = pkg;
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
	public App asPojo() {
		App app = new App();
		BeanUtils.copyProperties(this, app);
		return app;
	}

}
