package com.tangce.user.domain;

import java.io.Serializable;

import com.tangce.util.Page;

@SuppressWarnings("serial")
public class User extends Page implements Serializable {

	private Integer id;
	private String name;
	private String password;
	private String email;
	private Integer state;
	private Integer level;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "id:"+id+",name:"+name+",password:"+password;
	}
}
