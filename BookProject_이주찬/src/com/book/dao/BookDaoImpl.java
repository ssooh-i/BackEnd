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
	
	private static BookDao dao;
	
	private BookDaoImpl() {}
	
	public static BookDao getDao() {
		if(dao == null) dao = new BookDaoImpl();
		return dao;
	}

	DBUtil db = DBUtil.getInstance();
	
	@Override
	public int insertBook(BookDTO book) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO bookshop ")
		.append("(isbn, title, author, company, price) ")
		.append("VALUES ")
		.append("(?, ?, ?, ?, ?)");
		try(Connection conn = db.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {
			ps.setString(1, book.getIsbn());
			ps.setString(2, book.getTitle());
			ps.setString(3, book.getAuthor());
			ps.setString(4, book.getCompany());
			ps.setInt(5, book.getPrice());
			int res = ps.executeUpdate();
			return res;
		}catch(SQLException e) {
			
		}
		return 0;
	}

	@Override
	public List<BookDTO> listBook() {
		List<BookDTO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM bookshop ");
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			ps = conn.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new BookDTO(rs.getString("isbn"), rs.getString("title"),
						rs.getString("author"), rs.getString("company"), rs.getInt("price")));
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.close(rs, ps, conn);
		}
		return null;
	}

	@Override
	public int updateBook(BookDTO book) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE bookshop ")
		.append("SET title = ?, author = ?, company = ?, price = ? ")
		.append("WHERE isbn = ? ; ");
		try(Connection conn = db.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {
			ps.setString(1, book.getTitle());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getCompany());
			ps.setInt(4, book.getPrice());
			ps.setString(5, book.getIsbn());
			int res = ps.executeUpdate();
			return res;
		}catch(SQLException e) {
			
		}
		return 0;
	}

	@Override
	public int deleteBook(BookDTO book) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM bookshop ")
		.append("WHERE isbn = ? ; ");
		try(Connection conn = db.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {
			ps.setString(1, book.getIsbn());
			int res = ps.executeUpdate();
			return res;
		}catch(SQLException e) {
			
		}
		return 0;
	}

}
