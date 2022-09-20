package com.ssafy.service;

import java.util.List;
import com.ssafy.dao.EmpDao;
import com.ssafy.dao.EmpDaoImpl;
import com.ssafy.dto.EmpDTO;

public class EmpServiceImpl implements EmpService{
	public static EmpServiceImpl empService;
	
	public static EmpService getEmpService() {
		if(empService == null) {
			empService=new EmpServiceImpl();
		}
		return empService;
	}
	//------------------------------------------------------
	public int insertEmp(EmpDTO emp) {
		return EmpDaoImpl.getEmpDao().insertEmp(emp);
	}

	public List<EmpDTO> listEmp() {
		return EmpDaoImpl.getEmpDao().listEmp();
	}
	
	public int updateEmp(EmpDTO dto) {
		return EmpDaoImpl.getEmpDao().updateEmp(dto);
	}
	
	public int deleteEmp(EmpDTO dto) {
		return EmpDaoImpl.getEmpDao().deleteEmp(dto);
	}
}
