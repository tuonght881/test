package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.UsersDAO;
import com.poly.entity.Users;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class ChangePasswordController {

	@Autowired
	ParamService param;
	
	@Autowired
	SessionService ssSer;
	
	@Autowired
	UsersDAO dao;
	
	@PostMapping("/account/changePassword")
	public String changePassword(Model m, Users user) {
		
		String pass = param.getString("passwords", "");
		String pass2 = param.getString("passwordsTwo", "");
		Users u = ssSer.getAttribute("user");
		
		if(pass2.equalsIgnoreCase(pass)) {
			user.setUsers_id(u.getUsers_id());
			user.setActive(u.isActive());
			user.setBlocked(u.isBlocked());
			user.setCreatedate(u.getCreatedate());
			user.setEmail(u.getEmail());
			user.setFailed_login_attempts(u.getFailed_login_attempts());
			user.setFullname(u.getFullname());
			user.setPasswords(pass2);
			user.setPhone(u.getPhone());
			user.setRoles(u.isRoles());
			
			dao.save(user);
			m.addAttribute("succ", true);
		}else {
			m.addAttribute("errorNull", true);
		}
		
		return "/account/changePassword";
	}
	
}
