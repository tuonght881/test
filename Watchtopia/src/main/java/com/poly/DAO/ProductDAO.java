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
	
}
