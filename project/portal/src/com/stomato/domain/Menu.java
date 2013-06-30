package com.stomato.domain;

import java.util.List;

/**
 * 菜单
 * @author zyf
 *
 */
public class Menu{

	private Integer id ;
	
	/**
	 * 菜单名称
	 */
	private String name ;
	
	/**
	 * 描述
	 */
	private String desc ;
	
	/**
	 * 菜单路径
	 */
	private String path ;
	
	/**
	 * 父菜单ID 0表示没有父菜单
	 */
	private Integer parent ;
	
	/**
	 * 是否可见：0-不可见，1-可见
	 */
	private Integer visible ;

	/**
	 * 排序标识
	 */
	private String orderNo ;
	
	private Integer status;
	
	public Menu(){
		
	}

	public Menu(String name , String path , int parent , Integer visible,int status,String orderNo){
		this.name = name ;
		this.path = path ;
		this.parent = parent ;
		this.visible = visible ;
		this.orderNo = orderNo ;
		this.status = status;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getParent() {
		return parent;
	}

	public void setParent(Integer parent) {
		this.parent = parent;
	}

	public void setVisible(Integer visible) {
		this.visible = visible;
	}
	public Integer getVisible() {
		return visible;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * 非持久化对象
	 */
	
	private List<Menu> sunMenu ;
	
	private String visibleStr ;

	public List<Menu> getSunMenu() {
		return sunMenu;
	}

	public void setSunMenu(List<Menu> sunMenu) {
		this.sunMenu = sunMenu;
	}

	public String getVisibleStr() {
		if(this.visible == 0){
			visibleStr = "不显示";
		}else{
			visibleStr = "显示";
		}
		return visibleStr;
	}

}
