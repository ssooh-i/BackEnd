package com.ssafy.service;

import com.ssafy.dto.LoginDTO;

public interface LoginService {
	public LoginDTO getLoginUser(String id, String pwd);
}
