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
public class RegisterController {
	
	@Autowired
	ParamService paramSer;
	
	@Autowired
	UsersDAO dao;
	
	@GetMapping("/account/register")
	public String getRegister() {

		
		return "/account/register";
	}
	
	
	public boolean kiemTra(Model m) {
		
		
		String fullname = paramSer.getString("fullname", "");
		String email = paramSer.getString("email", "");
		String password = paramSer.getString("passwords", "");
		
		if(fullname.equalsIgnoreCase("")) {
			m.addAttribute("errorNull", true);
			return false;
		}
		if(email.equalsIgnoreCase("")) {
			m.addAttribute("errorNull", true);
			return false;
		}
		if(password.equalsIgnoreCase("")) {
			m.addAttribute("errorNull", true);
			return false;
		}
		
		return true;
	}
	
	@PostMapping("/account/register")
	public String CreateAccount(Users u, Model m) {
		String username = paramSer.getString("email", "");
		Users ukt = dao.findByUsersEmailObject(username);
		
		if(kiemTra(m)) {
			if(ukt != null) {
				m.addAttribute("errorEmail", true);
			}else
			{
				dao.save(u);
				m.addAttribute("succ", true);
			}
		}
		
		return "/account/register";
	}
}
