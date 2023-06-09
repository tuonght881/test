package com.poly.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.UsersDAO;
import com.poly.entity.Users;
import com.poly.service.EmailSenderService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;


@Controller
public class TestBon {

	

	@Autowired
	ParamService paramSer;
	
	@Autowired
	SessionService ssSer;

	@Autowired
	UsersDAO dao;

	
}
