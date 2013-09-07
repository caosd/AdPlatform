package com.stomato.form;


public class AppCategoryFormParam extends PublicFormParam{

	private String typeName;

	private Boolean visible;

	private Integer Parent;

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Boolean getVisible() {
		return visible;
	}

	public void setVisible(Boolean visible) {
		this.visible = visible;
	}

	public Integer getParent() {
		return Parent;
	}

	public void setParent(Integer parent) {
		Parent = parent;
	}
 
}
