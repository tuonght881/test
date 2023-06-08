package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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
@Table(name="Accounts")
public class Account implements Serializable{
private static final long serialVersionUID = 1L;
@Id
private String Username;
private String Password;
private String Fullname;
private String Email;
private String Photo;
private Boolean Activated;
private Boolean Admin;

@OneToMany(mappedBy = "account")
List<Order> orders; 
}
