package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.poly.DAO.BranchDAO;
import com.poly.DAO.ProductDAO;
import com.poly.DAO.ProductTypeDAO;
import com.poly.entity.Branch;

import com.poly.entity.ProductType;
import com.poly.entity.Products;
import com.poly.service.ParamService;

@Controller
public class ProductController {
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	BranchDAO branchDAO;
	
	@Autowired
	ProductTypeDAO typeDAO;
	
	@Autowired
	ParamService param;
	
	// Đầu Thêm sản phẩm
	@GetMapping("/product/addproduct")
	public String GetAddProduct(Model m) {
		
		List<Branch> branchs = branchDAO.findAll();
		List<ProductType> types = typeDAO.findAll();
		
		m.addAttribute("types", types);
		m.addAttribute("branchs", branchs);
		
		return "/admin/AddProduct";
	}
	
	
	@PostMapping("/product/addproduct")
	public String SetAddProduct(Model m, Products p) {
		try {
//			String img = file.getOriginalFilename();
			String img = param.getString("product_img", "");
			double price = Double.parseDouble(param.getString("product_price", ""));
			
			p.setProduct_img(img);
			p.setProduct_price(price);
			
			dao.save(p);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "/admin/AddProduct";
		
	}
	// Cuối Thêm sản phẩm
	

	// Đầu Cập nhật sản phẩm
	@GetMapping("/product/UpdateProduct")
	public String getUpdateProduct(Model m) {
		
		List<Products> p = dao.findAll();
		
		List<Branch> branchs = branchDAO.findAll();
		List<ProductType> types = typeDAO.findAll();
		
		m.addAttribute("typesList", types);
		m.addAttribute("branchsList", branchs);
		
		m.addAttribute("products", p);
		return "/admin/UpdateProduct";
		///
	}
	
	@RequestMapping("/product/edit/{id}")
	public String edit(Model m, @PathVariable("id") Integer id) {
		Products item = dao.findById(id).get();
		m.addAttribute("item", item);
		List<Products> items = dao.findAll();
		
		List<Branch> branchs = branchDAO.findAll();
		List<ProductType> types = typeDAO.findAll();
		
		m.addAttribute("typesList", types);
		m.addAttribute("branchsList", branchs);
		
		
//		Branch branchs = branchDAO.findById(item.getBranch().getBrands_id()).get();
//		ProductType types = typeDAO.findById(item.getType().getTypes_id()).get();
//		
//		m.addAttribute("types", types);
//		m.addAttribute("branchs", branchs);
		m.addAttribute("products", items);
		return "/admin/UpdateProduct";
	}
	
	@RequestMapping("/product/update")
	public String update(Products item) {
		dao.save(item);
		return "redirect:/product/edit/" + item.getProduct_id();
	}
	
	@RequestMapping("/product/delete/{id}")
	public String create(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/product/UpdateProduct";
	}
	
	// Đầu Cập nhật sản phẩm
}
