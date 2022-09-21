package com.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.book.dto.LoginDTO;

import common.DBUtil;

public class LoginDaoImpl implements LoginDao {

	private static LoginDaoImpl logDao;
	
	private LoginDaoImpl() {}
	
	public static LoginDao getLoginDao() {
		if(logDao == null) logDao = new LoginDaoImpl();
		return logDao;
	}
	
	@Override
	public LoginDTO getLoginuser(String userid, String userpwd) {
		
		LoginDTO dto = null;
		String sql = "select * from member where userid = ? and userpwd = ?";
		try(Connection conn = DBUtil.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);){
			
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			try(ResultSet rs = pstmt.executeQuery();){
				
				if(rs.next()) {
					dto = new LoginDTO();
					dto.setUserid(rs.getString("userid"));
					dto.setUserpwd(rs.getString("userpwd"));
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
