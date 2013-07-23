package com.stomato.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.jxls.transformer.XLSTransformer;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.stomato.domain.Part;
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

	public static void main(String[] args) {
		List<Object> resultList = new ArrayList<Object>();
		for (int i = 0; i < 20; i++) {
			resultList.add(new Part<String, String>(""+i,"str"+i));
		}
		Map<String,Object> beans = new HashMap<String, Object>();
		beans.put("result", resultList);
		try {
			OutputStream output = new FileOutputStream(new File("D:\\save.xlsx"));
			ExcelUtils.export2Excel("c:/log/tefst.xlsx", beans, output);
		}catch(Exception error){
			error.printStackTrace();
		}
	}
}