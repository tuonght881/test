package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer>{

}
