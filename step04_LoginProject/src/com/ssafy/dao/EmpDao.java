package com.ssafy.dao;

import java.util.List;
import com.ssafy.dto.EmpDTO;

public interface EmpDao {
	public int insertEmp(EmpDTO emp);
	public List<EmpDTO> listEmp();
	public int updateEmp(EmpDTO entity);
	public int deleteEmp(EmpDTO entity);
}
