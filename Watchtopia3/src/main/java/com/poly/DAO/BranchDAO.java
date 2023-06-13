package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.Branch;

public interface BranchDAO extends JpaRepository<Branch, Integer>{

}
