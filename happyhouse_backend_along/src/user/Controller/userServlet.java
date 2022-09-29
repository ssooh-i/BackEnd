package user.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.userDaoImpl;
import user.dto.userDto;

@WebServlet("/user")
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public userServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("action : " + action);
    	switch(action) {
	    	case "login":
	    		doLogin(request, response);
	    		break;
	    	case "logout":
	    		doLogout(request, response);
	    		break;
	    	case "join":
	    		doInsert(request, response);
	    		break;
	    	case "idcheck":
	    		idCheck(request, response);
				break;
	    	case "idcheck2":
	    		int cnt = idCheck2(request, response);
				response.setContentType("text/plain;charset=utf-8");
				PrintWriter out = response.getWriter();
	    		break;
	    	case "show":
	    		showInfo(request, response);
	    		break;
	    	case "update":
	    		updateInfo(request, response);
	    		break;
    	}
    	
    }
	
	private int idCheck2(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userid");
		try {
			int count = userDaoImpl.getuserDao().idCheck2(userId);
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 500;
		
	}
	private void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id=request.getParameter("user_id");
		String pwd=request.getParameter("user_password");
		userDto dto= userDaoImpl.getuserDao().getLoginUser(id, pwd);
		
		
		if(dto != null) {
			HttpSession session=request.getSession();
			session.setAttribute("logOK", dto);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}else {
			// id, password가 잘못입력되었을 때
			response.sendRedirect("/hh/login.jsp");
		}

	}
    
	private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session=request.getSession();  
		userDto entity=(userDto)session.getAttribute("logOK");
		
		if(entity != null) {
			session.removeAttribute("logOK");  //or session.invalidate(); //모든 세션종료
			response.sendRedirect("/hh/index.jsp");
		}
		
	}
	
	private void doInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		userDto userDto = new userDto();
		String root = request.getContextPath();
		userDto.setId(request.getParameter("userid"));
		userDto.setName(request.getParameter("username"));
		userDto.setPwd(request.getParameter("userpwd"));
		try {
			userDaoImpl.getuserDao().joinUser(userDto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(root + "/index.jsp");
	}
	
	private int idCheck(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("idCheck 합니다.");
		String userId = request.getParameter("user_id");
		try {
			System.out.println("userId : " + userId);
			System.out.println("idCheck를 체크한다.");
			String result = userDaoImpl.getuserDao().idCheck(userId);
			System.out.println("result : " + result);
			if(result == null) {
				// 되돌아가기 java에서 html을 어떻게 실행할까?
				request.setAttribute("msg", "해당 아이디로 가입된 계정이 없습니다.");
				String referer = request.getHeader("referer"); // 어디든 상관없이 referer로
				request.getRequestDispatcher("/login/find_password.jsp").forward(request, response);
			}else {
				// 비밀번호 출력 // 자바에서 html
				System.out.println("비밀번호 : " + result );
				request.setAttribute("msg", result);
				request.getRequestDispatcher("/login/printpw.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 500;
	}
	
	private void showInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		userDto dto=(userDto)session.getAttribute("logOK");
		String id=dto.getId();
		userDto user = userDaoImpl.getuserDao().getUserInfo(id);
		session.setAttribute("userinfo", user);
		
		RequestDispatcher rd=request.getRequestDispatcher("user/showMyinfo.jsp");
		rd.forward(request, response);
	}
	
	private void updateInfo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session=request.getSession();
		userDto dto=(userDto)session.getAttribute("logOK");
		String id = dto.getId();
		String pwd=request.getParameter("user_password");
		String name=request.getParameter("user_name");

		
		int cnt = userDaoImpl.getuserDao().doUpdate(id,pwd,name);
		if(cnt>0) {
			showInfo(request, response);
		}
		
	}
}