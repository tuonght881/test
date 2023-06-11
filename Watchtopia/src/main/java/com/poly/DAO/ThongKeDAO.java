package com.poly.DAO;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.ThongKe;


public interface ThongKeDAO  extends JpaRepository<ThongKe, String>{

//	@Query("select p.product_name as'name', p.product_price as'price', sum(d.quantity) as'total_qty'\r\n"
//			+ "from detail_orders d \r\n"
//			+ "inner join product p on d.product_id = p.product_id \r\n"
//			+ "group by p.product_name, p.product_price")
	List<ThongKe> getListTK();
	
//	@Query("select from OrderDetail d inner join Product")
	
//	@Query("SELECT new Report(o.category, sum(o.price), count(o)) " + " FROM Product o " + " GROUP BY o.category"
//			+ " ORDER BY sum(o.price) DESC")
}
