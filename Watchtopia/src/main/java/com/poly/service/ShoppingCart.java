package com.poly.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.DAO.CartItemDAO;
import com.poly.DAO.ProductDAO;
import com.poly.DAO.ShoppingCartService;
import com.poly.entity.CartItem;
import com.poly.entity.Products;
import com.poly.entity.Users;

@SessionScope
@Service("cart")
public class ShoppingCart implements ShoppingCartService{
	@Autowired
	ProductDAO repo;
	
	@Autowired
	SessionService ss;
	
	@Autowired
	CartItemDAO cart;
	
	Map<Integer, CartItem> map = new HashMap<Integer, CartItem>();
	
//	@Override
//	public List<CartItem2> getItems() {
//		ArrayList<CartItem2> list = new ArrayList<CartItem2>();
//		for(Integer key : map.keySet()) {
//			list.add(map.get(key));
//		}
//		return list;
//	}
	

	@Override
	public void add(int id) {
		Users u = ss.getAttribute("username");
		Products p = repo.findById(id).get();

		CartItem cartFind = cart.findByObjectCartSQL(p.getProduct_id(), u.getUsers_id());
		CartItem item = new CartItem();
		if(cartFind == null) {
			item.setProduct(p);
			item.setUsers(u);
			item.setQuantity(1);
		}else {
			item.setCart_id(cartFind.getCart_id());
			item.setProduct(p);
			item.setUsers(u);
			item.setQuantity(cartFind.getQuantity() + 1);
		}		
		cart.save(item);
	}

	@Override
	public void remove(int id) {
		
		if(map.containsKey(id)) {
			map.remove(id);
		}
		
	}

	@Override
	public void update(int id, int qty) {
		
		CartItem item = map.get(id);
		if(item != null) {
//			item.setQty(qty);
			map.put(id, item);
		}
		
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return map.keySet().size();
	}

	@Override
	public double getAmount() {
		
		double tongTien = 0.0;
		CartItem item = null;
		for(Integer id : map.keySet())
		{
			item = map.get(id);
//			tongTien += item.getPrice() * item.getQty();
		}
		
		return tongTien;
	}

	@Override
	public Collection<CartItem> getItems() {
		ArrayList<CartItem> ds = new ArrayList<CartItem>();
		for (Integer key : map.keySet()) {
			ds.add(map.get(key));
		}
		return ds;
	}
	
	
	
}
