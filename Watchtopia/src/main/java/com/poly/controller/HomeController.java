package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.poly.DAO.ProductDAO;
import com.poly.DAO.UsersDAO;
import com.poly.entity.Products;
import com.poly.entity.Users;
import com.poly.service.CookieService;
import com.poly.service.SessionService;

import jakarta.servlet.http.Cookie;

@Controller
public class HomeController {
	@Autowired
	ProductDAO dao;

	@Autowired
	SessionService ssSer;

	@Autowired
	UsersDAO udao;
	
	@Autowired

	CookieService cook;
	
	
	// có vấn đề để sau
	@GetMapping("/home/watch")
	public String getHome(Model m) {
		Products p = dao.findByKeywordsBySQL();
		String ucheck = cook.getValue("email");
		if(ucheck==null) {
			m.addAttribute("hidden", false);
			List<Products> items = dao.findByKeywordsAllBySQL();
			m.addAttribute("item", p);
			m.addAttribute("items", items);
		}else {
			m.addAttribute("hidden",true);
		List<Products> items = dao.findByKeywordsAllBySQL();
		m.addAttribute("item", p);
		m.addAttribute("items", items);
		}
		List<Products> items = dao.findByKeywordsAllBySQL();
		m.addAttribute("item", p);
		m.addAttribute("items", items);
		
		return "/home/index";
	}

	@GetMapping("/home/detailWatched/{id}")
	public String getDetailWatched(Model m, @PathVariable("id") int id) {

		Products p = dao.findById(id).get();
		m.addAttribute("p", p);

		return "/home/detailWatched";
	}

	
	// xét điều kiện chưa đăng nhập chọn vào trang cá nhân
	@GetMapping("/home/profile")
	public String getProfile(Model m) {
		String u = cook.getValue("checkEmail");
//		Users u = ssSer.getAttribute("username");
		if(u == null) {
			m.addAttribute("userNull", true);
			m.addAttribute("hidden", false);
			Products p = dao.findByKeywordsBySQL();
			List<Products> items = dao.findByKeywordsAllBySQL();
			m.addAttribute("item", p);
			m.addAttribute("items", items);
			return "/home/index";
		}else {
			return "redirect:/account/profileUser";
		}

	}
}
