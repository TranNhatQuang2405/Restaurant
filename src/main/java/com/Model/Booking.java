package com.Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the "Booking" database table.
 * 
 */
@Entity
@Table(name="\"Booking\"",schema = "project")
@NamedQuery(name="Booking.findAll", query="SELECT b FROM Booking b")
public class Booking implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	@Temporal(TemporalType.DATE)
	private Date date;

	private String email;

	private String message;

	private String name;

	private Integer npeople;

	private String phone;

	private Integer status;

	private String time;

	public Booking() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNpeople() {
		return this.npeople;
	}

	public void setNpeople(Integer npeople) {
		this.npeople = npeople;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Booking(Integer id, Date date, String email, String message, String name, Integer npeople, String phone,
			Integer status, String time) {
		this.id = id;
		this.date = date;
		this.email = email;
		this.message = message;
		this.name = name;
		this.npeople = npeople;
		this.phone = phone;
		this.status = status;
		this.time = time;
	}

}