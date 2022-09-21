package com.book.dao;

import com.book.dto.LoginDTO;

public interface LoginDao {
	
	public LoginDTO getLoginuser(String userid, String userpwd);
}
