package com.Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the "Users" database table.
 * 
 */
@Entity
@Table(name="\"Users\"", schema = "project")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String email;

	private String name;

	private String password;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="user")
	private List<Order> orders;

	public User() {
	}

	

	public User(String email, String name, String password) {
		this.email = email;
		this.name = name;
		this.password = password;
	}



	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Order addOrder(Order order) {
		getOrders().add(order);
		order.setUser(this);

		return order;
	}

	public Order removeOrder(Order order) {
		getOrders().remove(order);
		order.setUser(null);

		return order;
	}

}