/*
 * 文 件 名：TsException.java
 * 版    权：Copyright powerall. Co. Ltd. All Rights Reserved. 
 * 描    述：TS 2.0
 * 修 改 人：aken
 * 修改时间：2012-4-19
 * 修改内容：新增 
 */
package com.stomato.exception;

import java.io.Serializable;

/**
 * 自定义的异常类。
 * @author  aken
 * @version TS V2.0
 * @since 1.0
 */
public class AdPlatformException  extends Exception implements Serializable{

    private static final long serialVersionUID = 1L;

    private String code;

    private String message;

    /**
     * Constructor
     * @param originEx - original exception
     * @param code - exception code
     * @param message - exception message
     */
    public AdPlatformException(Exception originEx, String code, String message)
    {
        super(message, originEx);
        this.code = code;
        this.message = message;
    }

    /**
     * Constructor
     * 
     * @param code - exception code
     */
    public AdPlatformException(String code)
    {
        this.code = code;
    }
    
    /**
     * Get error code.
     * @return - error code
     */
    public String getCode()
    {
        return code;
    }

    /**
     * Get error message.
     * @return - error message
     */
    public String getMessage()
    {
        return message;
    }
}
