package com.ssafy.sido;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.sido.dto.Data;
import com.ssafy.sido.service.SidoService;
import com.ssafy.sido.service.SidoServiceImpl;

/**
 * Servlet implementation class SidoServlet
 */
@WebServlet("/sido")
public class SidoServlet extends HttpServlet {

	SidoService service;
	
	@Override
	public void init() throws ServletException {
		service = SidoServiceImpl.getInstance();
		super.init();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String path = "result.jsp";
		String result = "";
		switch(act) {
		case "sido":
			result = doSido(request, response);
			System.out.println("result : " + result);
			break;
		case "gugun":
			result = doGugun(request, response);
			System.out.println("result : " + result);
			break;
		case "dong":
			result = doDong(request, response);
			System.out.println("result : " + result);
			break;
		}
		request.setAttribute("result", result);
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private String doSido(HttpServletRequest request, HttpServletResponse response) {
		try {
			return service.getSido(null);
		}catch(Exception e) {
			
		}
		return "";
	}
	private String doGugun(HttpServletRequest request, HttpServletResponse response) {
		try {
			Data data = new Data();
			data.setCode(request.getParameter("code"));
			return service.getGugun(data);
		}catch(Exception e) {
			
		}
		return "";
	}
	private String doDong(HttpServletRequest request, HttpServletResponse response) {
		try {
			Data data = new Data();
			data.setCode(request.getParameter("code"));
			return service.getDong(data);
		}catch(Exception e) {
			
		}
		return "";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
