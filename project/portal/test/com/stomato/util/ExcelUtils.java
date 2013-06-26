package com.stomato.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import com.stomato.domain.Part;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

public class ExcelUtils {

	public static String doExcel(String from, Map<String, Object> beans,
			String to) throws ParsePropertyException, InvalidFormatException, IOException {
		String path = "c:\\log";
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
		Map<String,Object> beans = new HashMap<String, Object>();
		beans.put("result", resultList);
		try {
			ExcelUtils.doExcel("test.xlsx", beans, "doTest.xlsx");
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
