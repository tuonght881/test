package com.poly.entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

@Entity
@Table(name = "cart")
public class CartItem implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//	private Users users_id;
//	private Products product_id;
	
	@Id
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "users_id")
	Users users;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "product_id")
	Products product;
}
