package com.ssafy.sido.dto;

public class Data {
	String name;
	String code;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "Data [name=" + name + ", code=" + code + "]";
	}
	
}
