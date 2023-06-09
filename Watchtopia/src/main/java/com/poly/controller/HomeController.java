package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.DAO.ProductDAO;
import com.poly.entity.Products;
import com.poly.entity.Users;
import com.poly.service.SessionService;

@Controller
public class HomeController {
	@Autowired
	ProductDAO dao;
	
	@Autowired
	SessionService ssSer;
	
	
	@GetMapping("/home/watch")
	public String getHome(Model m) {
		Products p = dao.findByKeywordsBySQL();
		List<Products> items = dao.findByKeywordsAllBySQL();
		m.addAttribute("item", p);
		m.addAttribute("items", items);
		return "/home/index";
	}
	
	@GetMapping("/account/profile")
	public String getProfile(Model m) {
		Users u = ssSer.getAttribute("username");
		if(u == null) {
			m.addAttribute("userNull", true);
			Products p = dao.findByKeywordsBySQL();
			List<Products> items = dao.findByKeywordsAllBySQL();
			m.addAttribute("item", p);
			m.addAttribute("items", items);
			return "/home/index";
		}else {
			return "redirect:/product/addproduct";
		}
		
	}
}
