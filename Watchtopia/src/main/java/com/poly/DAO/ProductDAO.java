package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.poly.entity.Products;

public interface ProductDAO extends JpaRepository<Products, Integer>{

	@Query(value = "select * from product p where p.product_price = (select MIN(p.product_price) from product p)" , nativeQuery = true)
	Products findByKeywordsBySQL();
	
	@Query(value = "select * from product p where p.product_price not in (select MIN(p.product_price) from product p)" , nativeQuery = true)
	List<Products> findByKeywordsAllBySQL();
	
	@Query(value = "select * from product p where p.product_name like ?1" , nativeQuery = true)
	List<Products> findByKeywordsAllBySQL(String name);
	
	@Query(value = "select c.product_id, p.product_img, p.product_name, p.product_price, p.types_id ,p.brands_id, p.product_describe, c.quantity "
			+ " from product p inner join cart c on c.product_id = p.product_id "
			+ " where c.users_id = ?1 "
			+ " group by c.product_id, p.product_img, p.product_name, p.product_price, p.types_id, p.brands_id, p.product_describe, c.quantity " , nativeQuery = true)
	List<Products> findCartByKeyWordBySQL(int maKH);
}
