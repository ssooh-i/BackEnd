package com.ssafy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.dto.LoginDTO;
import com.ssafy.service.LoginServiceImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch(action) {
			case "login":
				doLogin(request, response);
				break;
			case "logout":
				doLogout(request, response);
				break;
		}
	}
	//로그인--------------------------------------------------------------------------
	protected void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
//		System.out.println(id+"  "+pwd);
		
		String root=request.getContextPath();
		LoginDTO dto=LoginServiceImpl.getLoginService().getLoginUser(id, pwd);
		if(dto != null) {
			/*세션 설정*/
			HttpSession session=request.getSession();
			session.setAttribute("logOK", dto);     //세션이름: logOK
			response.sendRedirect(root + "/logtest/loginOK.jsp");
		}else {
			response.sendRedirect(root + "/logtest/loginFail.jsp");
		}
	}
	
	//로그아웃--------------------------------------------------------------------------
	protected void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		System.out.println();
		LoginDTO dto=(LoginDTO)session.getAttribute("logOK");
		String root=request.getContextPath();
		
		if(dto != null) {
			session.removeAttribute("logOK");       //or session.invalidate(); //모든 세션종료
			response.sendRedirect(root + "/index.jsp");
		}
	}
}







