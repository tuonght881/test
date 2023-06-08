package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.ProductDAO;
import com.poly.entity.Report;

@Controller
public class ReportController {
	@Autowired
	ProductDAO dao;

	@RequestMapping("/report/inventory-by-category")
	public String inventory(Model model) {
		List<Report> list = dao.getInventoryByCategory();
		model.addAttribute("list", list);
		return "inventory";
	}
}
