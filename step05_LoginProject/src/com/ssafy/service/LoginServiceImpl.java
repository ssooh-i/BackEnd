package com.ssafy.service;

import com.ssafy.dao.LoginDaoImpl;
import com.ssafy.dto.LoginDTO;

public class LoginServiceImpl implements LoginService{
	private static LoginServiceImpl loginService;
	
	public static LoginService getLoginService(){
		if(loginService==null) {
			loginService=new LoginServiceImpl();
		}
		return loginService;
	}
	
	@Override
	public LoginDTO getLoginUser(String id, String pwd) {
		return LoginDaoImpl.getLoginDao().getLoginUser(id, pwd);
	}

}








