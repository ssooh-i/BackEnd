package com.ssafy.service;

import java.util.List;

import com.ssafy.dao.EmpDao;
import com.ssafy.dto.EmpDTO;

public interface EmpService {
	public int insertEmp(EmpDTO emp);
	public List<EmpDTO> listEmp();
	public int updateEmp(EmpDTO entity);
	public int deleteEmp(EmpDTO entity);
}











