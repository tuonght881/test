package com.poly.controller;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.UsersDAO;
import com.poly.entity.Users;
import com.poly.service.ParamService;

@Controller
public class TestMot {
	
	@Autowired
	ParamService paramSer;
	
	
	
}
