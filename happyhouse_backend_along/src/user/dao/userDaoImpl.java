package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import user.dto.userDto;
import util.DBUtil;

public class userDaoImpl implements userDao {

	private static userDaoImpl userDao;
	private DBUtil dbUtil;

	// 생성자 호출
	public static userDao getuserDao() {
		if (userDao == null) {
			userDao = new userDaoImpl();
		}
		return userDao;
	}

	// 로그인 테스트
	@Override
	public userDto getLoginUser(String id, String pwd) {
		userDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from members where user_id=? and user_password=?";
			conn = DBUtil.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new userDto();
				dto.setId(rs.getString("user_id")); // SQL 컬럼명은 대.소문자 상관없음
				dto.setPwd(rs.getString("user_password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.getInstance().close(rs, pstmt, conn);
		}
		return dto;
	}

	// id가 맞는지 체크한다.
	@Override
	public String idCheck(String userId) throws SQLException {
		int cnt = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String password = null;
		
		try {
			String sql = "select * from members where user_id = ?";
			conn = DBUtil.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				password = rs.getString("user_password"); // password 반환
				System.out.println("password : " + password);
			}

		} finally {
			DBUtil.getInstance().close(rs, pstmt, conn);
		}
		return password;
	}
	@Override
	public int idCheck2(String userId) throws SQLException {
		int cnt = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select count(user_id) from members where user_id = ?";
			conn = DBUtil.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			DBUtil.getInstance().close(rs, pstmt, conn);
		}
		return cnt;
	}

	// User 추가
	@Override
	public int joinUser(userDto userDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBUtil.getInstance().getConnection();
			String sql = "insert into members values (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);

			int idx = 0;
			pstmt.setString(++idx, userDto.getId());
			pstmt.setString(++idx, userDto.getName());
			pstmt.setString(++idx, userDto.getPwd());

			return pstmt.executeUpdate();

		} finally {
			DBUtil.getInstance().close(conn, pstmt);
		}
	}

	// user list 출력
	@Override
	public List<userDto> listUser() throws SQLException {
		List<userDto> list = new ArrayList<userDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getInstance().getConnection();
			String sql = "select user_id, user_name, user_password from members";
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				userDto userdto = new userDto();
				userdto.setId("user_id");
				userdto.setName("user_name");
				userdto.setPwd("user_password");

				list.add(userdto);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return list;
	}

	public userDto getUserInfo(String id) {
		userDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from members where user_id=?";
			conn = DBUtil.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new userDto();
				dto.setId(rs.getString("user_id")); // SQL 컬럼명은 대.소문자 상관없음
				dto.setPwd(rs.getString("user_password"));
				dto.setName(rs.getString("user_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.getInstance().close(rs, pstmt, conn);
		}
		return dto;
	}

	@Override
	public int doUpdate(String id, String pwd, String name){
		
	    String sql="update members set user_password=?, user_name=? where user_id=?";
	    
	    try(Connection conn = DBUtil.getInstance().getConnection();
	    		PreparedStatement pstmt = conn.prepareStatement(sql)){
	    	pstmt.setString(1, pwd);
	        pstmt.setString(2, name);
	        pstmt.setString(3, id);
	        
	        return pstmt.executeUpdate();
	    
	    }catch(SQLException e) {
			e.printStackTrace();
		}
	    
	    return 0;
	}

}