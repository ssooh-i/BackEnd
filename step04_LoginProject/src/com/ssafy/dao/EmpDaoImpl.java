package com.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.dto.EmpDTO;

import common.DBUtil;

public class EmpDaoImpl implements EmpDao{
	private static EmpDaoImpl empDao;
	
	public static EmpDao getEmpDao() {
		if(empDao == null) {
			empDao=new EmpDaoImpl();
		}
		return empDao;
	}

	//전체보기--------------------------------
	@Override
	public List<EmpDTO> listEmp() {
		List<EmpDTO> list=new ArrayList<>();
		String sql="select * from emp order by eno desc";
		EmpDTO dto=null;
		
		try(Connection conn=DBUtil.getInstance().getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery()){
			
			while(rs.next()) {
				dto=new EmpDTO();
				dto.setEno(rs.getInt("eno"));
				dto.setEname(rs.getString("ename"));
				dto.setPhone(rs.getString("phone"));
				dto.setDept(rs.getString("dept"));
				
				list.add(dto);   //중요!!!!
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//추가하기--------------------------------
	@Override
	public int insertEmp(EmpDTO emp) {
		String sql="insert into emp(eno, ename, phone,dept) values(eno,?,?,?)";

		try(Connection conn=DBUtil.getInstance().getConnection();
				PreparedStatement pstmt=conn.prepareStatement(sql)) {
			pstmt.setString(1, emp.getEname());
			pstmt.setString(2, emp.getPhone());
			pstmt.setString(3, emp.getDept());
			return pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}		
		return 0;
	}
	//수정하기--------------------------------
	@Override
	public int updateEmp(EmpDTO emp) {
		
		String sql="update emp set phone=?,dept=? where eno=?";
		try(Connection conn=DBUtil.getInstance().getConnection();
				PreparedStatement pstmt=conn.prepareStatement(sql)) {
			pstmt.setString(1, emp.getPhone());
			pstmt.setString(2, emp.getDept());
			pstmt.setInt(3, emp.getEno());
			return pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}		
		return 0;
	}
	//삭제하기--------------------------------
	@Override
	public int deleteEmp(EmpDTO emp) {
		int cnt = 0;
		
		String sql="delete from emp where eno=?";
		try(Connection conn=DBUtil.getInstance().getConnection();
				PreparedStatement pstmt=conn.prepareStatement(sql)) {
			pstmt.setInt(1, emp.getEno());
			cnt = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}		
		return cnt;
	}

}







