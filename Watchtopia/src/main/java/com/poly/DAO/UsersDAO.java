package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.poly.entity.Users;

public interface UsersDAO extends JpaRepository<Users, Integer>{
	@Query("SELECT o FROM Users o WHERE o.email =?1")
	Users findByUsersEmailObject(String id);
	
	
}
