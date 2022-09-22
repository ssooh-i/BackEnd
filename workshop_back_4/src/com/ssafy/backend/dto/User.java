package com.ssafy.backend.dto;

//기본생성자, 인자 3개받는 생성자, getter & setter, toString추가
public class User {
	private String id;
    private String pass;
    private String name;
    
	public User() {
		super();
	}
	public User(String id, String pass, String name) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		 return "[" + (id != null ? "id=" + id + ", " : "") + (pass != null ? "pass=" + pass + ", " : "") + (name != null ? "name=" + name : "") + "]";
	}
}
