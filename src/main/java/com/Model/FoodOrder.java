package com.Model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the "FoodOrder" database table.
 * 
 */
@Entity
@Table(name="\"FoodOrder\"", schema = "project")
@NamedQuery(name="FoodOrder.findAll", query="SELECT f FROM FoodOrder f")
public class FoodOrder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	private Integer amount;
	//bi-directional many-to-one association to Food
	@ManyToOne
	@JoinColumn(name="\"foodID\"")
	private Food food;

	//bi-directional many-to-one association to Order
	@ManyToOne
	@JoinColumn(name="\"orderID\"")
	private Order order;

	public FoodOrder() {
	}
	
	public FoodOrder(Integer amount, Food food) {
		this.amount = amount;
		this.food = food;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Food getFood() {
		return this.food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
}