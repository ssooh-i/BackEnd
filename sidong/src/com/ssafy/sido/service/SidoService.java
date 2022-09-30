package com.ssafy.sido.service;

import com.ssafy.sido.dto.Data;

public interface SidoService {
	String getSido(Data data) throws Exception;
	String getGugun(Data data) throws Exception;
	String getDong(Data data) throws Exception;
}
