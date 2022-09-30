package com.ssafy.sido.service;

import com.google.gson.Gson;
import com.ssafy.sido.dao.SidoDAO;
import com.ssafy.sido.dao.SidoDAOImpl;
import com.ssafy.sido.dto.Data;

import sun.security.jca.GetInstance;

public class SidoServiceImpl implements SidoService {
	SidoDAO dao = null;
	private static SidoServiceImpl service = new SidoServiceImpl();
	private SidoServiceImpl() {
		dao = SidoDAOImpl.getInstance();
	}
	public static SidoServiceImpl getInstance() {
		return service;
	}
	
	@Override
	public String getSido(Data data) throws Exception {
		Gson gson = new Gson();
		String json = gson.toJson(dao.getSido(data)); 
		return json;
	}

	@Override
	public String getGugun(Data data) throws Exception {
		Gson gson = new Gson();
		String json = gson.toJson(dao.getGugun(data)); 
		return json;
	}

	@Override
	public String getDong(Data data) throws Exception {
		Gson gson = new Gson();
		String json = gson.toJson(dao.getDong(data)); 
		return json;
	}

}
