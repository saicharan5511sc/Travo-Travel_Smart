package com.travoapp.model.dto;

public class Users {
	private String name;
	private String email;
	private String password;
	private String role;
	private String city;
	public Users(String name, String email, String password, String role, String city) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.city = city;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	
	
}
