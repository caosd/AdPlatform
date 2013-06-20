/*
 * 文 件 名：Part.java
 * 版    权：Copyright powerall. Co. Ltd. All Rights Reserved. 
 * 描    述：TS 2.0
 * 修 改 人：jiandong
 * 修改时间：2012-5-4
 * 修改内容：新增 
 */
package com.stomato.domain;

import java.io.Serializable;

/**
 * @author  jiandong
 * @version TS V2.0
 * @since 1.0
 */
public class Part<F,S> implements Serializable{

	private static final long serialVersionUID = 1L;

	public Part(){}
	public Part(F f,S s){
		this.first = f;
		this.second = s;
	}
	public F first;
	
	public S second;

	/**
	 * returns the first.
	 * @return the first
	 */
	public F getFirst() {
		return first;
	}

	/**
	 * Sets the first.
	 * @param first the first to set
	 */
	public void setFirst(F first) {
		this.first = first;
	}

	/**
	 * returns the second.
	 * @return the second
	 */
	public S getSecond() {
		return second;
	}

	/**
	 * Sets the second.
	 * @param second the second to set
	 */
	public void setSecond(S second) {
		this.second = second;
	}
}
