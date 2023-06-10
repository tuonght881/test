package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.CartItem;
import com.poly.entity.Products;

public interface CartItemDAO extends JpaRepository<CartItem, Integer> {
	
}
