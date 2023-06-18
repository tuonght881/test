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
import com.poly.DAO.InventoryDAO;
import com.poly.DAO.OrderDAO;
import com.poly.DAO.OrderDetailDAO;
import com.poly.DAO.ProductDAO;
import com.poly.entity.CartItem;
import com.poly.entity.Inventory;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Products;
import com.poly.entity.Users;
import com.poly.service.EmailSenderService;
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
	InventoryDAO invenDao;

	@Autowired
	ParamService param;
	
	@Autowired
	EmailSenderService sendEmail;

	// init cart
	@RequestMapping("/cart/view")
	public String view(Model m) {

		String ucheck = ss.getAttribute("usercheck");

		if (ucheck == null) {
			m.addAttribute("userNull", true);
			m.addAttribute("hidden", false);
			Products p = productDAO.findByKeywordsBySQL();
			List<Products> items = productDAO.findByKeywordsAllBySQL();
			m.addAttribute("item", p);
			m.addAttribute("items", items);
			return "/home/index";
		} else {
			try {
				double tongTien = 0;
				Users u = ss.getAttribute("username");

				List<CartItem> item = cartDao.findAllBySQL(u.getUsers_id());
				List<CartItem> cartQuantity = cartDao.findAllBySQL(u.getUsers_id());
//				
				for (int i = 0; i < item.size(); i++) {
					tongTien += item.get(i).getProduct().getProduct_price() * item.get(i).getQuantity();
				}

				// m.addAttribute("soLuong", soLuong);

				m.addAttribute("sum", tongTien);
				m.addAttribute("cartQuantity", cartQuantity);
				m.addAttribute("cart", item);

			} catch (NumberFormatException e) {

			}

			return "/home/cart";
		}

	}

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id, Model m) {

		String ucheck = ss.getAttribute("usercheck");

		if (ucheck == null) {
			m.addAttribute("userNull", true);
			m.addAttribute("hidden", false);
			Products p = productDAO.findByKeywordsBySQL();
			List<Products> items = productDAO.findByKeywordsAllBySQL();
			m.addAttribute("item", p);
			m.addAttribute("items", items);
			return "/home/index";
		} else

			cart.add(id);
		return "redirect:/home/detailWatched/{id}";
	}

	@RequestMapping("/cart/buy/{id}")
	public String buy(@PathVariable("id") Integer id, Model m) {
		String ucheck = ss.getAttribute("usercheck");

		if (ucheck == null) {
			m.addAttribute("userNull", true);
			m.addAttribute("hidden", false);
			Products p = productDAO.findByKeywordsBySQL();
			List<Products> items = productDAO.findByKeywordsAllBySQL();
			m.addAttribute("item", p);
			m.addAttribute("items", items);
			return "/home/index";
		} else {
			cart.add(id);
			return "redirect:/cart/view";
		}

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

	@RequestMapping("/cart/update")
	public String update(@RequestParam("id") Integer id, @RequestParam("action") String action) {
		cart.update(id, action);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}

	public boolean checkPay(Model m) {
		String address = param.getString("address", "");
		String fullname = param.getString("fullname", "");
		String phone = param.getString("phone", "");

		if (fullname.equalsIgnoreCase("")) {
			m.addAttribute("addressNull", true);
			return false;
		}
		if (phone.equalsIgnoreCase("")) {
			m.addAttribute("addressNull", true);
			return false;
		}
		if (address.equalsIgnoreCase("")) {
			m.addAttribute("addressNull", true);
			return false;
		}

		return true;
	}

	// Đặt hàng
	@PostMapping("/cart/pay")
	public String cart(Model m) {
		Users u = ss.getAttribute("username");
		String address = param.getString("address", "");
		String fullname = param.getString("fullname", "");
		String phone = param.getString("phone", "");

		if (checkPay(m)) {
			// insert voo bang order
			Order orderAdd = new Order();

			orderAdd.setEmail(u.getEmail());
			orderAdd.setFullname(fullname);
			orderAdd.setOrders_address(address);
			orderAdd.setOrders_time(new Date());
			orderAdd.setPhone(phone);

			orderDao.save(orderAdd);

			List<CartItem> lisst = cartDao.findAllBySQL(u.getUsers_id());
			// insert vo bang order detail
			// test222
			for (int i = 0; i < lisst.size(); i++) {

				Inventory inventory = invenDao.findObject(lisst.get(i).getProduct().getProduct_id());
				inventory.setQuantity(inventory.getQuantity() - lisst.get(i).getQuantity());

				invenDao.save(inventory);

				Order orFind = orderDao.findTop1BySQL();
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(orFind);
				orderDetail.setProduct(lisst.get(i).getProduct());
				orderDetail.setQuantity(lisst.get(i).getQuantity());

				orderDetailDao.save(orderDetail);
				cartDao.deleteById(lisst.get(i).getCart_id());
			}
			
			sendEmail.sendSimpleEmail(u.getEmail(), "Watchtopia cảm ơn", "Cảm ơn bạn đã tin tưởng và sử dụng dịch vụ của chúng tôi.");

		} else {
			try {
				double tongTien = 0;

				List<CartItem> item = cartDao.findAllBySQL(u.getUsers_id());
				List<CartItem> cartQuantity = cartDao.findAllBySQL(u.getUsers_id());
//				
				for (int i = 0; i < item.size(); i++) {
					tongTien += item.get(i).getProduct().getProduct_price() * item.get(i).getQuantity();
				}

				// m.addAttribute("soLuong", soLuong);

				m.addAttribute("sum", tongTien);
				m.addAttribute("cartQuantity", cartQuantity);
				m.addAttribute("cart", item);

			} catch (NumberFormatException e) {

			}

		}
		return "/home/cart";
	}

}
