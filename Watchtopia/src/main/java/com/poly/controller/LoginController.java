package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.UsersDAO;
import com.poly.entity.Users;
import com.poly.service.CookieService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class LoginController {

	@Autowired
	ParamService paramSer;

	@Autowired
	CookieService cookieSer;

	@Autowired
	SessionService ssSer;

	@Autowired
	UsersDAO dao;

	@GetMapping("/account/login")
	public String getLogin(Model m) {

		String user = cookieSer.getValue("user");
		if (user != null) {
			String pass = cookieSer.getValue("pass");
			m.addAttribute("user", user);
			m.addAttribute("pass", pass);
		}

		return "/account/login";
	}

	@PostMapping("/account/login")
	public String postLogin(Model m) {
		String username = paramSer.getString("email", "");
		String password = paramSer.getString("password", "");
		boolean remember = paramSer.getBoolea("remember", false);

		Users u = dao.findByUsersEmailObject(username);
		if (u != null) {
			if (password.equalsIgnoreCase(u.getPasswords())) {

				if (u.isRoles() != true) {
					ssSer.setAttribute("username", u);
					if (remember) {
						cookieSer.create("user", username, 10);
						cookieSer.create("pass", password, 10);
					} else {
						cookieSer.delete("user");
						cookieSer.delete("pass");
					}

					return "redirect:/home/watch";
				} else {
					ssSer.setAttribute("username", u);
					if (remember) {
						cookieSer.create("user", username, 10);
						cookieSer.create("pass", password, 10);
					} else {
						cookieSer.delete("user");
						cookieSer.delete("pass");
					}
					return "redirect:/product/addproduct";
				}

			} else {

				m.addAttribute("errorPassword", true);
				return "/account/login";
			}

		} else {
			m.addAttribute("errorEmail", true);
			return "/account/login";
		}

	}
}
