package com.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.dao.BookDaoImpl;
import com.book.dao.LoginDaoImpl;
import com.book.dto.BookDTO;
import com.book.dto.LoginDTO;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		switch(action) {
			case "login":
				doLogin(request, response);
				break;
			case "logout":
				doLogout(request, response);
				break;
			case "bkinsert":
				doBookInsert(request, response);
				break;
			case "bkupdate":
				doBookUpdate(request, response);
				break;
			case "bklist":
				doBookList(request, response);
				break;
			case "bkdelete":
				doDel(request, response);
				break;
		}
	}


	private void doBookInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDTO dto = new BookDTO();
		
		dto.setIsbn(request.getParameter("isbn"));
		dto.setTitle(request.getParameter("title"));
		dto.setAuthor(request.getParameter("author"));
		dto.setCompany(request.getParameter("company"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		
		int n = BookDaoImpl.getBookDao().insertBook(dto);
		if(n > 0) {
			doBookList(request, response);
			
		}else {
		}
		
	}
	

	private void doBookUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDTO dto = new BookDTO();
		dto.setIsbn(request.getParameter("isbn"));
		dto.setTitle(request.getParameter("title"));
		dto.setAuthor(request.getParameter("author"));
		dto.setCompany(request.getParameter("company"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		
		int n = BookDaoImpl.getBookDao().updateBook(dto);
		if(n > 0) {
			doBookList(request, response);
			
		}else {
		}
	}
	
	private void doBookList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<BookDTO> list = BookDaoImpl.getBookDao().listBook();
		
		if(list != null) {
			request.setAttribute("bklist", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("book/bookList.jsp");
			request.setAttribute("bklist", list);
			rd.forward(request, response);
				
		}
		
	}


	private void doDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDTO dto = new BookDTO();
		dto.setIsbn(request.getParameter("isbn"));
		
		int n = BookDaoImpl.getBookDao().deleteBook(dto);
		if(n > 0) {
			doBookList(request, response);
			
		}else {
		}
		
	}



	private void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		
		LoginDTO dto = LoginDaoImpl.getLoginDao().getLoginuser(userid, userpwd);
		String root = request.getContextPath();
		if(dto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginOK", dto);
			response.sendRedirect(root + "/login/loginOK.jsp");
			
		}else {
			response.sendRedirect(root + "/login/fail.jsp");
		}
		
	}
	
	private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO)session.getAttribute("loginOK");
		String root = request.getContextPath();
		
		if(dto != null) {
			session.removeAttribute("loginOK");
			response.sendRedirect(root + "/index.jsp");
		}
	}

}
