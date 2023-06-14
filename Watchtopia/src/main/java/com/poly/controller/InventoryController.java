package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.DAO.InventoryDAO;
import com.poly.DAO.ProductDAO;
import com.poly.entity.Inventory;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class InventoryController {

	@Autowired
	InventoryDAO ivenDAO;
	//kk
	@Autowired
	SessionService sService;
	@Autowired
	ParamService pService;
	
	List<Inventory> list;
	
	@RequestMapping("/admin/inventory")
	public String inventory(Model m) {
		list	= ivenDAO.findAll();

		m.addAttribute("listInventory", list);
		
		return "/admin/inventory";
	}
	// cap nhat moi
	@RequestMapping("/admin/inventory/edit")
	public String editInventory(Model m) {
		int idV = pService.getInt("id", -1);
		
		Inventory inven = ivenDAO.findBfindById(idV);
		list	= ivenDAO.findAll();
		sService.setAttribute("SessionInventory", inven);
		m.addAttribute("itemInven", inven);
		m.addAttribute("listInventory", list);
		
		return "/admin/inventory"; 
	}
	
	@PostMapping("/admin/inventory/update")
	public String update( Model m) {
		list	= ivenDAO.findAll();
		int qty =  pService.getInt("quantity", 0);

			Inventory inventory = sService.getAttribute("SessionInventory");
			inventory.setQuantity(qty);
			ivenDAO.save(inventory);
		
			list	= ivenDAO.findAll();
			m.addAttribute("listInventory", list);
		return "/admin/inventory"; 
	}
}
