package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entity.CartItem;

public interface CartItemDAO extends JpaRepository<CartItem, Integer> {
	@Query(value="select * "
			+ "from cart c where c.product_id =:id and c.users_id =:uid", nativeQuery=true)
	List<CartItem> findAllBySQL(@Param("id") Integer id, @Param("uid") Integer uid);
	
	@Query(value="select * "
			+ "from cart c where c.users_id =:uid", nativeQuery=true)
	List<CartItem> findAllBySQL(@Param("uid") Integer uid);
	
	@Query(value="select * "
			+ "from cart c where c.product_id =:id and c.users_id =:uid", nativeQuery=true)
	CartItem findByObjectCartSQL(@Param("id") Integer id, @Param("uid") Integer uid);
	
	@Query(value = "select c.cart_id ,c.product_id, p.product_img, p.product_name, p.product_price, p.types_id ,p.brands_id, p.product_describe, c.quantity "
			+ " from cart c inner join product p on c.product_id = p.product_id "
			+ " where c.users_id =:id "
			+ " group by c.cart_id ,c.product_id, p.product_img, p.product_name, p.product_price, p.types_id, p.brands_id, p.product_describe, c.quantity " , nativeQuery = true)
	List<CartItem> findCartByKeyWordBySQL(@Param("id") Integer maKH);
	
//	
//	@Query(value="select COUNT(c.product_id) as SL "
//			+ "from cart c where c.product_id =:prid and c.users_id =uid", nativeQuery=true)
//	Integer findQuantityProductCart(@Param("prid") Integer id, @Param("uid") Integer uid);
}
