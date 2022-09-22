package com.book.dao;

import com.book.dto.LoginDTO;

public interface LoginDao {
	LoginDTO getLoginUser(LoginDTO dto);
}
