package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.DAO.CartItemDAO;
import com.poly.DAO.ProductDAO;
import com.poly.entity.CartItem;
import com.poly.entity.Products;
import com.poly.entity.Users;
import com.poly.service.SessionService;
import com.poly.service.ShoppingCart;
@Controller
public class CartItemController {
	@Autowired
	ShoppingCart cart;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	SessionService ss;

	@RequestMapping("/cart/view")
	public String view(Model m) {
		
		Users u = ss.getAttribute("username");
		
		List<Products> item = productDAO.findCartByKeyWordBySQL(u.getUsers_id());

		m.addAttribute("cart", item);

		return "/home/cart";
	}

	
	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/home/detailWatched/{id}";
	}
	@RequestMapping("/cart/buy/{id}")
	public String buy(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}
	
	//Đặt hàng
	
}
