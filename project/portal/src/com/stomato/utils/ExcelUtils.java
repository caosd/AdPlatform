package com.stomato.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.transformer.XLSTransformer;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
/**
 * excel工具类，使用excel模板生成excel
 * @author  jiandong
 */
public class ExcelUtils {
	
	private static final Logger logger = Logger.getLogger(ExcelUtils.class);
	/**
	 * 使用模板生成excel
	 * @param from 模板路径
	 * @param beans 值
	 * @param outputStream 输出流
	 */
	public static <T> void export2Excel(String tempFile, Map<String,T> beans,OutputStream outputStream){
		if( beans == null ){
			logger.error("beans不能为null");
			return;
		}
		XLSTransformer transformer = new XLSTransformer();
		InputStream inputStream = null;
		try {
            inputStream = new BufferedInputStream(new FileInputStream(new File(tempFile)));
            HSSFWorkbook workbook = (HSSFWorkbook) transformer.transformXLS(inputStream, beans);
            workbook.write(outputStream);
        }catch (Exception e) {
        	logger.error(e);
		}finally{
			 if(inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    logger.error("[@生成EXCEL失败]"+e.getMessage(), e);
                    e.printStackTrace();
                }
            }
            try {
                outputStream.flush();
                outputStream.close();
            } catch (IOException e) {
                logger.error("关闭流异常", e);
                e.printStackTrace();
            }
		}
	}
	/**
	 * 使用模板生成excel
	 * @param from 模板路径
	 * @param beans 值
	 * @param outputStream 输出流
	 */
	public static <T> void export2Excel(String name,String tempFile, Map<String,T> beans,HttpServletResponse response){
		response.reset();
	    response.setContentType("APPLICATION/vnd.ms-excel");
		try {
			String fileName = URLEncoder.encode(name,"UTF-8")+"-" + DateUtils.getDateStr(DateUtils.patternB);
		    response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+".xls\"");
		} catch (UnsupportedEncodingException e) {}
		try {
			export2Excel(tempFile, beans, response.getOutputStream());
		} catch (IOException e) {
			logger.error("导出Excel异常", e);
		}
	}
}