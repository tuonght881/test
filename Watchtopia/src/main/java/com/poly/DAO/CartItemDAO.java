package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entity.CartItem;
import com.poly.entity.Products;

public interface CartItemDAO extends JpaRepository<CartItem, Integer> {
	@Query(value="select * "
			+ "from cart c where c.product_id =:id and c.users_id =:uid", nativeQuery=true)
	List<CartItem> findAllBySQL(@Param("id") Integer id, @Param("uid") Integer uid);
}
