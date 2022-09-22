package com.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.book.dto.LoginDTO;

import common.DBUtil;

public class LoginDaoImpl implements LoginDao {
	
	private static LoginDao dao;
	
	private LoginDaoImpl() {}
	
	public static LoginDao getDao() {
		if(dao == null) dao = new LoginDaoImpl();
		return dao;
	}
	
	DBUtil db = DBUtil.getInstance();

	@Override
	public LoginDTO getLoginUser(LoginDTO dto) {
		LoginDTO loginUser = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM member ")
		.append("WHERE userid = ? AND userpwd = ? ;");
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, dto.getUserid());
			ps.setString(2, dto.getUserpwd());
			rs = ps.executeQuery();
			if(rs.next()) {
				loginUser = new LoginDTO(rs.getString("userid"), rs.getString("userpwd"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.close(rs, ps, conn);
		}
		
		return loginUser;
	}

}
