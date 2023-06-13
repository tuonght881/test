package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.poly.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer>{
	@Query(value="select * from orders o where o.email like ?1 ", nativeQuery=true)
	Order findAllBySQL(String email);
}
