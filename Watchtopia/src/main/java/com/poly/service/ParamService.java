package com.poly.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest req;
	
	public String getString(String name, String defaultValue) {
		if(name != null) {
			return req.getParameter(name);
		}
		return defaultValue;
	}
	
	public int getInt(String name, int defaultValue) {
		if(name != null) {
			return Integer.parseInt(req.getParameter(name));
		}
		return defaultValue;
	}
	
	public boolean getBoolea(String name, boolean defaultValue) {
		if(name != null) {
			return Boolean.parseBoolean(req.getParameter(name));
		}
		return defaultValue;
	}
	
	public Date getDate(String name, String pattern) {
		try {
			
			SimpleDateFormat format = new SimpleDateFormat(pattern);
			String temp = req.getParameter(name);
			
			Date date = format.parse(temp);
			return date;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public File save(MultipartFile file, String path) {
		File dir = new File(req.getServletContext().getRealPath(path));
		if(!dir.exists()) {
			dir.mkdirs();
		}
		try {
			File saveFile = new File(dir, file.getOriginalFilename());
			file.transferTo(saveFile);
			return saveFile;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
