package com.ssafy.sido.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.sido.dto.Data;
import com.ssafy.sido.util.DBUtil;

public class SidoDAOImpl implements SidoDAO {
	private final DBUtil dbUtil = DBUtil.getInstance();
	private static SidoDAOImpl dao = new SidoDAOImpl();
	private SidoDAOImpl() {
		
	}
	public static SidoDAOImpl getInstance() {
		return dao;
	}
	@Override
	public ArrayList<Data> getSido(Data data) throws SQLException {
		ArrayList<Data> list = new ArrayList<Data>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select sidoname , left(dongCode,2) sido\r\n" + 
					"from dongCode \r\n" + 
					"where right(dongcode,8) = '00000000'");
			
			pstmt = conn.prepareStatement(sql.toString());
			rst = pstmt.executeQuery();

			while(rst.next()) {
				Data dto = new Data();
				dto.setName(rst.getString(1));
				dto.setCode(rst.getString(2));
				list.add(dto);
			}
			
		}finally {
			dbUtil.close(rst, pstmt, conn);
		}
		return list;
	}
	@Override
	public ArrayList<Data> getGugun(Data data) throws SQLException {
		ArrayList<Data> list = new ArrayList<Data>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select gugunname , left(dongCode,4) gugun\r\n" + 
					"from dongCode \r\n" + 
					"where \r\n" + 
					"	right(dongcode,5) = '00000'\r\n" + 
					"	and\r\n" + 
					"	left(dongcode,2) = ?\r\n" + 
					"    and\r\n" + 
					"    gugunname is not null;");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, data.getCode());
			rst = pstmt.executeQuery();

			while(rst.next()) {
				Data dto = new Data();
				dto.setName(rst.getString(1));
				dto.setCode(rst.getString(2));
				list.add(dto);
			}
			
		}finally {
			dbUtil.close(rst, pstmt, conn);
		}
		return list;
	}
	@Override
	public ArrayList<Data> getDong(Data data) throws SQLException {
		ArrayList<Data> list = new ArrayList<Data>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select dongcode, dongname\r\n" + 
					"from dongCode \r\n" + 
					"where \r\n" + 
					"	left(dongcode,4) = ?\r\n" + 
					"    and\r\n" + 
					"    dongname is not null");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, data.getCode());
			rst = pstmt.executeQuery();

			while(rst.next()) {
				Data dto = new Data();
				dto.setCode(rst.getString(1));
				dto.setName(rst.getString(2));
				list.add(dto);
			}
			
		}finally {
			dbUtil.close(rst, pstmt, conn);
		}
		return list;
	}
	
}
