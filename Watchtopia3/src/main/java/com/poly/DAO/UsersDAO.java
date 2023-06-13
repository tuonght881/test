package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.poly.entity.Users;

public interface UsersDAO extends JpaRepository<Users, Integer>{
	@Query("SELECT o FROM Users o WHERE o.email =?1")
	Users findByUsersEmailObject(String id);
	
	
	@Query(value = "select u.users_id, u.fullname, u.passwords, u.email, u.phone , u.active, u.blocked, u.failed_login_attempts, u.last_login, u.roles "
			+ "from users u inner join  Logs l  on l.users_id = u.users_id "
			+ "group by u.users_id, u.fullname, u.passwords, u.email, u.phone , u.active, u.blocked, u.failed_login_attempts, u.last_login, u.roles" , nativeQuery = true)
	List<Users> findByKeywordsBySQL();
}
