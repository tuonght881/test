package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Inventory;

public interface InventoryDAO extends JpaRepository<Inventory, Integer>{

	@Query("select i from Inventory i")
	List<Inventory> getListInventories();
	
	Inventory  findBfindById(int id);
	
}
