package com.poly.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
//	private Integer id;
//	private String name;
//	private double price;
//	private int qty = 1;
//	
//	public CartItem(CartItem item) {
//		this.id = item.getId();
//		this.name = item.getName();
//		this.price = item.getPrice();
//		this.qty = 1;
//	}
	@Id
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "users_id")
	Users users;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "product_id")
	Products product;

	public CartItem(CartItem item) {
		super();
		this.users = item.getUsers();
		this.product = item.getProduct();
	}
}
