package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.CartItem;

public interface CartItemDAO extends JpaRepository<CartItem, String> {
//
}
