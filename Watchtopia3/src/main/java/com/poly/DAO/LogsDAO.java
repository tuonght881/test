package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Logs;


public interface LogsDAO extends JpaRepository<Logs, Integer>{
	@Query(value = "SELECT TOP 1 * FROM Logs ORDER BY log_id DESC" , nativeQuery = true)
	Logs findByKeywordsBySQL();
}
