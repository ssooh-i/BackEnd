package com.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.xdevapi.PreparableStatement;
import com.ssafy.dto.LoginDTO;

import common.DBUtil;

public class LoginDaoImpl implements LoginDao{
	private static LoginDaoImpl loginDao;

	public static LoginDao getLoginDao() {
		if(loginDao == null) {
			loginDao=new LoginDaoImpl();
		}
		return loginDao;
	}
	//-------------------------------------------------------------------
	@Override
	public LoginDTO getLoginUser(String id, String pwd) {
		LoginDTO dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			String sql="select * from users where id=? and pwd=?";
			conn=DBUtil.getInstance().getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new LoginDTO();
				dto.setId(rs.getString("id"));   //SQL 컬럼명은 대.소문자 상관없음
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setPoint(rs.getDouble("point"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.getInstance().close(rs, pstmt, conn);
		}
		return dto;
	}

}


















