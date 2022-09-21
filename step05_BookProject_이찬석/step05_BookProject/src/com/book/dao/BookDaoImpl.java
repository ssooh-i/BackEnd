package com.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.book.dto.BookDTO;

import common.DBUtil;

public class BookDaoImpl implements BookDao {
	private static BookDaoImpl bookDao;
	
	private BookDaoImpl() {};
	
	public static BookDao getBookDao() {
		if(bookDao == null) bookDao = new BookDaoImpl();
		return bookDao;
	}

	@Override
	public int insertBook(BookDTO dto) {
		
		String sql = "insert into bookshop(isbn, title, author, company, price)"
				+ " values (?, ?, ?, ?, ?)";
		
		try(Connection conn = DBUtil.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getIsbn());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getAuthor());
			pstmt.setString(4, dto.getCompany());
			pstmt.setInt(5, dto.getPrice());
			
			return pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public List<BookDTO> listBook() {

		List<BookDTO> list = new ArrayList<>();
		String sql = "select * from bookshop";
		BookDTO dto;
		try(Connection conn = DBUtil.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			
			while(rs.next()) {
				dto = new BookDTO();
				
				dto.setIsbn(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setAuthor(rs.getString(3));
				dto.setCompany(rs.getString(4));
				dto.setPrice(rs.getInt(5));
				
				list.add(dto);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int updateBook(BookDTO dto) {
		String sql = "update bookshop set price = ? where isbn = ?";
		
		try(Connection conn = DBUtil.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, dto.getPrice());
			pstmt.setString(2, dto.getIsbn());
			
			return pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int deleteBook(BookDTO dto) {
		
		String sql = "delete from bookshop where isbn = ?";
		
		try(Connection conn = DBUtil.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getIsbn());
			
			return pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	
}
