package com.Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the "Food" database table.
 * 
 */
@Entity
@Table(name="\"Food\"",schema = "project")
@NamedQuery(name="Food.findAll", query="SELECT f FROM Food f order by f.id")
public class Food implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;

	private String description;

	@Column(name="food_type")
	private String foodType;

	private String image;

	private String name;

	private Integer price;

	//bi-directional many-to-one association to FoodOrder
	@OneToMany(mappedBy="food",cascade = CascadeType.REMOVE)
	private List<FoodOrder> foodOrders;

	public Food() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFoodType() {
		return this.foodType;
	}

	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public List<FoodOrder> getFoodOrders() {
		return this.foodOrders;
	}

	public void setFoodOrders(List<FoodOrder> foodOrders) {
		this.foodOrders = foodOrders;
	}

	public FoodOrder addFoodOrder(FoodOrder foodOrder) {
		getFoodOrders().add(foodOrder);
		foodOrder.setFood(this);

		return foodOrder;
	}

	public FoodOrder removeFoodOrder(FoodOrder foodOrder) {
		getFoodOrders().remove(foodOrder);
		foodOrder.setFood(null);

		return foodOrder;
	}

}