/*
 * 文 件 名：ParameterException.java
 * 版    权：Copyright powerall. Co. Ltd. All Rights Reserved. 
 * 描    述：TS 2.0
 * 修 改 人：jiandong
 * 修改时间：2012-6-12
 * 修改内容：新增 
 */
package com.stomato.exception;

/**
 * @author  jiandong
 * @version TS V2.0 
 * @since 1.0
 */
public class ParameterException extends Exception {

	/**  */
    private static final long serialVersionUID = 5477164490895976763L;

    /**
	 * 
	 */
	public ParameterException(String message) {
		super(message);
	}
	
	public ParameterException(String message,Exception throwable){
		super(message, throwable);
	}
}
