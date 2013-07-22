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

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import com.stomato.domain.Part;

public class ExcelUtils {
/**
 * if (model != null) {
	        Map<String, List<T>> beans = new HashMap<String, List<T>>();
	        beans.put("model", model);
	        //读取数据模板
	        InputStream inputStream = null;
	        XLSTransformer transformer = new XLSTransformer();
	        try {
	            inputStream = new BufferedInputStream(new FileInputStream(new File(tempFile)));
	            HSSFWorkbook workbook = (HSSFWorkbook) transformer.transformXLS(inputStream, beans);
	            workbook.write(outputStream);
	        } finally {
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
	                logger.error("", e);
	                e.printStackTrace();
	            }
	        }
	    }
 */
	public static void doExcel(String from, Map<String, Object> beans,OutputStream outputStream) throws ParsePropertyException, InvalidFormatException, IOException {
		String path = "c:\\log";
		XLSTransformer transformer = new XLSTransformer();
		String sfrom = path + "\\" + from;// 模板文件
		InputStream inputStream = null;
		try {
            inputStream = new BufferedInputStream(new FileInputStream(new File(sfrom)));
            HSSFWorkbook workbook = (HSSFWorkbook) transformer.transformXLS(inputStream, beans);
            workbook.write(outputStream);
        }catch (Exception e) {
			e.printStackTrace();
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
			ExcelUtils.doExcel("test.xlsx", beans, output);
		} catch (ParsePropertyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}


/*package com.stomato.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.RichTextString;

import com.stomato.domain.Part;

public class ExcelUtils {
	
	private static final Logger logger = Logger.getLogger(ExcelUtils.class);
	*//**
	 * 数据导出 Excel 
	 * @param fileName 导出的文件名称
	 * @param title	文件内容标题
	 * @param columnMap	导出内容的列名<数据库字段名，Execl表列名>
	 * @param listData<Map<数据库字段名，Execl表列名>>导出内容的值
	 * @throws Exception 
	 *//*
	public static InputStream export2Excel(String[] columns , List<Object[]> listData) throws Exception{
		InputStream input = null;
		try{
	        HSSFWorkbook workbook = new HSSFWorkbook();
	        HSSFSheet sheet = workbook.createSheet("sheet1");
	        //创建表头
	        HSSFRow row = sheet.createRow(0);
	        HSSFCell cell = row.createCell(0);
	        cell.setCellValue("No.");
	        for (int i = 0; i < columns.length; i++) {
	        	cell = row.createCell(i+1);
	        	cell.setCellValue(columns[i]);
		        sheet.autoSizeColumn(i);
			}
	        //创建数据,进行for循环
	        for (int i = 0,j = listData.size(); i < j; i++ )
	        {
	            row = sheet.createRow(i + 1);
	            cell = row.createCell(0);
	            cell.setCellValue(i + 1);
	            Object[] rowsData = listData.get(i);
	            int c = 1;
	            for (Object rowData : rowsData ) {
		            cell = row.createCell(c);
		            if( Double.class == rowData.getClass()){
		            	cell.setCellValue(Double.parseDouble(rowData+""));
		            }else if(Integer.class == rowData.getClass()){
		            	cell.setCellValue(Integer.parseInt(rowData+""));
		            }else if(Date.class == rowData.getClass()){
		            	cell.setCellValue((Date)rowData);
		            }else if(Calendar.class == rowData.getClass()){
		            	cell.setCellValue((Calendar)rowData);
		            }else if(RichTextString.class == rowData.getClass()){
		            	cell.setCellValue((RichTextString)rowData);
		            }else{
		            	cell.setCellValue(rowData+"");
		            }
		            c ++;
				}
	        }
	        listData.clear();
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        workbook.write(baos);
	        byte[] ba = baos.toByteArray();
	        input = new ByteArrayInputStream(ba);
		}catch (Exception e) {
			e.printStackTrace();
		}
        return input;
	}

	*//** 读取模板并封装数据到outputStream,输出到客户端 *//*
	public static <T> void setDataToExcel(List<T> model, OutputStream outputStream, String tempFile) throws Exception {
	    if (model != null) {
	        Map<String, List<T>> beans = new HashMap<String, List<T>>();
	        beans.put("model", model);
	        //读取数据模板
	        InputStream inputStream = null;
	        XLSTransformer transformer = new XLSTransformer();
	        try {
	            inputStream = new BufferedInputStream(new FileInputStream(new File(tempFile)));
	            HSSFWorkbook workbook = (HSSFWorkbook) transformer.transformXLS(inputStream, beans);
	            workbook.write(outputStream);
	        } finally {
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
	                logger.error("", e);
	                e.printStackTrace();
	            }
	        }
	    }
	}
	*//**
	 * 导出excel模板
	 * @param from
	 * @param beans
	 * @param to
	 * @return
	 * @throws ParsePropertyException
	 * @throws InvalidFormatException
	 * @throws IOException
	 *//*
	public static String transformer(String from, Map<String, Object> beans,
			String to) throws ParsePropertyException, InvalidFormatException, IOException {
		String path = "D:\\jiandong\\project\\AdPlatform\\project\\portal\\test\\com\\stomato\\util\\";
		XLSTransformer transformer = new XLSTransformer();
		String sfrom = path + "\\" + from;// 模板文件
		String sto = path + "\\" + to;// 要生成的文件
		transformer.transformXLS(sfrom, beans, sto);
		return sto;
	}

	public static void main(String[] args) {
		List<Object> resultList = new ArrayList<Object>();
		for (int i = 0; i < 20; i++) {
			resultList.add(new Part<String, String>(""+i,"str"+i));
		}
		try {
			//OutputStream output = new FileOutputStream(new File("D:\\save.xlsx"));
			//ExcelUtils.setDataToExcel(resultList, output, "D:\\jiandong\\project\\AdPlatform\\project\\portal\\test\\com\\stomato\\util\\doTest.xlsx");
			Map<String,Object> beans = new HashMap<String,Object>();
		    beans.put("model", resultList);
			ExcelUtils.transformer("test.xlsx", beans, "export.xlsx");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
*/