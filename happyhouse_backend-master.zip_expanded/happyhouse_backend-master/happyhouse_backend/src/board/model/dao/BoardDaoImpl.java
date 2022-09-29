package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import board.model.dto.BoardDto;
import user.dto.userDto;
import util.DBUtil;

public class BoardDaoImpl implements BoardDao {
	//싱글톤 만들기
	private static BoardDao dao;
	private BoardDaoImpl() {}
	
	public static BoardDao getDao() {
		if(dao == null) dao = new BoardDaoImpl(); //널이면 생성해주기
		return dao;//있으면 생성 안하고 돌려주기
	}
	
	DBUtil db = DBUtil.getInstance(); //DBUtil안에 있는 싱글톤 쓸려고

	@Override
	public int insertBoard(BoardDto board) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		System.out.println(board.getTitle() + " "+board.getContent()+" " + board.getUser_id());
		
		sql.append("insert into board (title, content, user_id) values (?, ?, ?);");
//		String sql = "insert into members values (?, ?, ?)";
		try {
			conn = db.getConnection(); 
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getUser_id());
			
			int res = pstmt.executeUpdate();//DB에서 Select 뺴고 다 이거씀
			return res;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.close(pstmt, conn);
		}
		return cnt;
	}
	@Override
	public List<BoardDto> getlistBoard() {
		List<BoardDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from board; ");
		try {
			conn = db.getConnection(); 
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();//쿼리받기
			
			while(rs.next()) { //context 빼고 받아오는 list
				list.add(new BoardDto(rs.getInt("article_no"), rs.getString("title"),rs.getString("content"),rs.getString("user_id")));
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(rs, pstmt, conn);
		}
		return list;
	}

	@Override
	public BoardDto searchBoard(BoardDto board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from board ")
		.append("WHERE article_no = ?; ");
		try {
			conn = db.getConnection(); 
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setInt(1, board.getArticle_no());
			rs = pstmt.executeQuery();//쿼리받기
			
			if(rs.next()) { 
				return new BoardDto(rs.getInt("article_no"), rs.getString("title"),rs.getString("content"),
						rs.getString("user_id"));
			}
			return null;
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(rs, pstmt, conn);
		}
		return null;
	}

	@Override
	public int updateBoard(BoardDto board) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append("update board ")
		.append("set title = ?, content = ?")
		.append("where article_no = ?; ");
		try {
			conn = db.getConnection(); 
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getArticle_no());
			int res = pstmt.executeUpdate();
			
			return res;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.close(pstmt, conn);
		}
		return cnt;
	}

	@Override
	public int deleteBoard(BoardDto board) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append("delete from board where article_no = ?;");
		try {
			conn = db.getConnection(); 
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, board.getArticle_no());
			int res = pstmt.executeUpdate();
			
			return res;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.close(pstmt, conn);
		}
		return cnt;
	}

}
