package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class TestHai {

	@Autowired
	ParamService paramSer;

	@Autowired
	SessionService ssSer;
	
	
	
}
