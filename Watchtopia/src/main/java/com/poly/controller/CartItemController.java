package com.poly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.DAO.CartItemDAO;
import com.poly.DAO.OrderDAO;
import com.poly.DAO.OrderDetailDAO;
import com.poly.DAO.ProductDAO;
import com.poly.entity.CartItem;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Products;
import com.poly.entity.Users;
import com.poly.service.ParamService;
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

	@Autowired
	CartItemDAO cartDao;

	@Autowired
	OrderDAO orderDao;

	@Autowired
	OrderDetailDAO orderDetailDao;

	@Autowired
	ParamService param;

	// init cart
	@RequestMapping("/cart/view")
	public String view(Model m) {
		try {
			double tongTien = 0;
//			int soLuong = 0;
			Users u = ss.getAttribute("username");

			List<Products> item = productDAO.findCartByKeyWordBySQL(u.getUsers_id());

			for (int i = 0; i < item.size(); i++) {
				tongTien += item.get(i).getProduct_price();
				// soLuong += cartDao.findQuantityProductCart(item.get(i).getProduct_id(),
				// u.getUsers_id());

			}

			// m.addAttribute("soLuong", soLuong);

			m.addAttribute("sum", tongTien);

			m.addAttribute("cart", item);

		} catch (NumberFormatException e) {
			// TODO: handle exception
		}

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

		Users u = ss.getAttribute("username");

		List<CartItem> list = cartDao.findAllBySQL(id, u.getUsers_id());

		for (int i = 0; i < list.size(); i++) {

			cartDao.deleteById(list.get(i).getCart_id());
		}

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

	// Đặt hàng
	@PostMapping("/cart/pay")
	public String cart() {
		Users u = ss.getAttribute("username");
		String address = param.getString("address", "");

		// insert voo bang order
		Order orderAdd = new Order();

		orderAdd.setEmail(u.getEmail());
		orderAdd.setFullname(u.getFullname());
		orderAdd.setOrders_address(address);
		orderAdd.setOrders_time(new Date());
		orderAdd.setPhone(u.getPhone());

		orderDao.save(orderAdd);

		
		
		List<CartItem> lisst = cartDao.findAllBySQL(u.getUsers_id());
		// insert vo bang order detail
		
		for (int i = 0; i < lisst.size(); i++) {
			Order orFind = orderDao.findAllBySQL(u.getEmail());
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(orFind);
			orderDetail.setProduct(lisst.get(i).getProduct());
			orderDetail.setQuantity(lisst.get(i).getQuantity());

			orderDetailDao.save(orderDetail);
		}

		cartDao.deleteAll();

		return "redirect:/cart/view";
	}

}
