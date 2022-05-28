package com.Model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the "InfoOrder" database table.
 * 
 */
@Entity
@Table(name="\"InfoOrder\"",schema = "project")
@NamedQuery(name="InfoOrder.findAll", query="SELECT i FROM InfoOrder i")
public class InfoOrder implements Serializable {
	private static final long serialVersionUID = 1L;

	

	private String address;

	private String city;

	private String email;

	private String fullname;

	private String phone;

	private String typepay;

	//bi-directional one-to-one association to Order
	@Id
	@OneToOne
	@JoinColumn(name="id")
	private Order order;

	public InfoOrder() {
	}
	
	public InfoOrder(String address, String city, String email, String fullname, String phone, String typepay,
			Order order) {
		this.address = address;
		this.city = city;
		this.email = email;
		this.fullname = fullname;
		this.phone = phone;
		this.typepay = typepay;
		this.order = order;
	}

	public InfoOrder(String address, String city, String email, String fullname, String phone, String typepay) {
		super();
		this.address = address;
		this.city = city;
		this.email = email;
		this.fullname = fullname;
		this.phone = phone;
		this.typepay = typepay;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTypepay() {
		return this.typepay;
	}

	public void setTypepay(String typepay) {
		this.typepay = typepay;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}