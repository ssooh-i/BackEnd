package com.book.dto;

public class LoginDTO {
	private String userid;
	private String userpwd;
	
	
	
	public LoginDTO() {
		
	}
	public LoginDTO(String userid, String userpwd) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	
	
}
