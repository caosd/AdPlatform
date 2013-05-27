package com.stomato.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.service.ConfigService;

@Controller
@RequestMapping("/sdk")
public class DownloadController {
	
	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private ConfigService configService;
	
	@RequestMapping(value="/download", method=RequestMethod.GET)
	public String download(HttpServletRequest request, HttpServletResponse response) {
		String fileName = configService.loadConfig("released_sdk");
		String contentType = "application/octet-stream";
		String downloadDir = "/WEB-INF/download/";
		try {
			download(request, response, contentType, downloadDir, fileName);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}

	private void download(HttpServletRequest request,
			HttpServletResponse response, String contentType,
			String path, String realName) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		String ctxPath = request.getSession().getServletContext().getRealPath("/");
		String downLoadPath = ctxPath + path + realName;

		File file = new File(downLoadPath);
		if (!file.exists()) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		long fileLength = file.length();

		response.setContentType(contentType);
		response.setHeader("Content-disposition", "attachment; filename=" + new String(realName.getBytes("utf-8"), "ISO8859-1"));
		response.setHeader("Content-Length", String.valueOf(fileLength));

		bis = new BufferedInputStream(new FileInputStream(downLoadPath));
		bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
	}
}
