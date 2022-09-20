package com.ssafy.backend.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.backend.dto.Book;
import com.ssafy.backend.dto.User;

// 이 서블릿이 호출되기 위해서는 url 상에 http://server_ip:port/context_name/main 이 필요하다.
@WebServlet("/main")
public class MainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        process(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "regist":
                doRegist(request, response);
                break;
            case "login":
            	doLogin(request, response);
            	break;
            case "logout":
            	doLogout(request, response);
            	break;
        }
    }

    private void doRegist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int price = Integer.parseInt(request.getParameter("price"));
        String desc = request.getParameter("desc");
        
        Book book = new Book(isbn, title, author, price, desc);
        request.setAttribute("book", book);
        RequestDispatcher disp = request.getRequestDispatcher("/regist_result.jsp");
        disp.forward(request, response);
    }
    
    private void doLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String id=request.getParameter("id");
    	String pass=request.getParameter("pass");
    	
    	if("ssafy".equals(id) && "1234".equals(pass)) {
    		User user=new User(id, pass, "김싸피");
    		HttpSession session=request.getSession();
    		session.setAttribute("loginUser", user);
    		response.sendRedirect(request.getContextPath() +"/index.jsp");
    	}else {
    		request.setAttribute("msg","로그인 실패");
    		RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
    		rd.forward(request, response);
    	}
    }
    
    private void doLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session=request.getSession();
    	session.invalidate();
    	response.sendRedirect(request.getContextPath() +"/index.jsp");
    }
}







