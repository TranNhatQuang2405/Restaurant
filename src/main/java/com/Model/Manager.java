package com.Model;

import java.io.Serializable;
import javax.persistence.*;



@Entity
@Table(name="\"Manager\"", schema = "project")
@NamedQuery(name="Manager.findAll", query="SELECT m FROM Manager m")
public class Manager implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;

	private String email;

	private String password;

	public Manager(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public Manager() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}