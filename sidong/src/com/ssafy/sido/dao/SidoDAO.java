package com.ssafy.sido.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.sido.dto.Data;

public interface SidoDAO {
	ArrayList<Data> getSido(Data data) throws SQLException;
	ArrayList<Data> getGugun(Data data) throws SQLException;
	ArrayList<Data> getDong(Data data) throws SQLException;
}
