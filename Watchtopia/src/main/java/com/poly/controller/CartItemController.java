package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.service.ShoppingCart;
@Controller
public class CartItemController {
	@Autowired
	ShoppingCart cart;

	@RequestMapping("/cart/view")
	public String view(Model m) {

		m.addAttribute("cart", cart.getItems());

		return "/home/cart";
	}

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
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
}
