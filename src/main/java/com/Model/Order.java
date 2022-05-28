package com.Model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the "Order" database table.
 * 
 */
@Entity
@Table(name="\"Order\"", schema = "project")
@NamedQuery(name="Order.findAll", query="SELECT o FROM Order o")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	private Timestamp date;

	private Integer status;

	//bi-directional many-to-one association to FoodOrder
	@OneToMany(mappedBy="order", cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
	private List<FoodOrder> foodOrders;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="email")
	private User user;

	public Order() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public List<FoodOrder> getFoodOrders() {
		return this.foodOrders;
	}

	public void setFoodOrders(List<FoodOrder> foodOrders) {
		this.foodOrders = foodOrders;
	}

	public FoodOrder addFoodOrder(FoodOrder foodOrder) {
		getFoodOrders().add(foodOrder);
		foodOrder.setOrder(this);

		return foodOrder;
	}

	public FoodOrder removeFoodOrder(FoodOrder foodOrder) {
		getFoodOrders().remove(foodOrder);
		foodOrder.setOrder(null);

		return foodOrder;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}