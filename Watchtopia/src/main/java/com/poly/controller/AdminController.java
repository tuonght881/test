package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.DAO.BranchDAO;
import com.poly.DAO.ProductDAO;
import com.poly.DAO.ProductTypeDAO;
import com.poly.entity.Branch;
import com.poly.entity.ProductType;
import com.poly.entity.Products;
import com.poly.service.ParamService;

@Controller
public class AdminController {
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	BranchDAO branchDAO;
	
	@Autowired
	ProductTypeDAO typeDAO;
	
	@Autowired
	ParamService param;
	
	
	@GetMapping("/product/addproduct")
	public String GetAddProduct(Model m) {
		
		List<Branch> branchs = branchDAO.findAll();
		List<ProductType> types = typeDAO.findAll();
		
		m.addAttribute("types", types);
		m.addAttribute("branchs", branchs);
		
		return "/admin/AddProduct";
	}
	
	
	@GetMapping("/product/UpdateProduct")
	public String getUpdateProduct(Model m) {
		return "/admin/UpdateProduct";
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
}
