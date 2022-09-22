package cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//기존에 세션이 있었나?
		session.removeAttribute("cart");
		response.sendRedirect(request.getContextPath()+"/myShop.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//1.파라메타 
		request.setCharacterEncoding("utf-8");
		String product = request.getParameter("product");
		
		//2. 비지니스
		HttpSession session = request.getSession();
		//기존에 카트가있었나?
		Object obj = session.getAttribute("cart");
		List<String> cart = null;
		if(obj == null) {
			cart = new ArrayList<>();
			session.setAttribute("cart", cart);
		}else {
			cart = (List) obj;
		}
		
		cart.add(product); // 담아주기
		
		//3.프리젠테이션 로직 (뷰)
		RequestDispatcher disp = request.getRequestDispatcher("/myShop.jsp");
		disp.forward(request, response);
	}

}
