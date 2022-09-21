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

import com.book.dao.BookDao;
import com.book.dao.BookDaoImpl;
import com.book.dao.LoginDao;
import com.book.dao.LoginDaoImpl;
import com.book.dto.BookDTO;
import com.book.dto.LoginDTO;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	BookDao bookDao = BookDaoImpl.getDao();
	LoginDao loginDao = LoginDaoImpl.getDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch(action) {
		case "login":
			doLogin(request, response);
			break;
		case "logout":
			doLogout(request, response);
			break;
		case "insertBook":
			doInsertBook(request, response);
			break;
		case "bookList":
			doBookList(request, response);
			break;
		case "updateBook":
			doUpdateBook(request, response);
			break;
		case "delBook":
			doDelBook(request, response);
			break;
		}
	}

	private void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDTO dto = new LoginDTO(request.getParameter("userid"), request.getParameter("userpwd"));
		LoginDTO res = loginDao.getLoginUser(dto);
		if(res != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", res);
			response.sendRedirect(request.getContextPath() + "/login/loginOk.jsp");
		}else {
			response.sendRedirect(request.getContextPath() + "/login/loginFail.jsp");
		}
	}
	private void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
			session.removeAttribute("loginUser");
		}
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		
	}


	private void doInsertBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDTO dto = new BookDTO(
				request.getParameter("isbn"),
				request.getParameter("title"),
				request.getParameter("author"),
				request.getParameter("company"),
				Integer.parseInt(request.getParameter("price"))
				);
		int res = bookDao.insertBook(dto);
		if(res > 0) {
			doBookList(request, response);
		}else {
			
		}
	}

	private void doBookList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<BookDTO> list = bookDao.listBook();
		request.setAttribute("bookList", list);
		
		request.getRequestDispatcher("/book/bookList.jsp")
		.forward(request, response);
	}

	private void doUpdateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDTO dto = new BookDTO(request.getParameter("isbn"), request.getParameter("title"),
				request.getParameter("author"), request.getParameter("company"),
				Integer.parseInt(request.getParameter("price")));
		int res = bookDao.updateBook(dto);
		if(res > 0) {
			doBookList(request, response);
		}else {
			
		}
	}

	private void doDelBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDTO dto = new BookDTO();
		dto.setIsbn(request.getParameter("isbn"));
		int res = bookDao.deleteBook(dto);
		if(res > 0) {
			doBookList(request, response);
		}else {
			
		}
	}

}
