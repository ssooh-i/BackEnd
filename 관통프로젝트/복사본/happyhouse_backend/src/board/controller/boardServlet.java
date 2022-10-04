package board.controller;

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
import com.book.dto.BookDTO;

import board.model.dao.BoardDao;
import board.model.dao.BoardDaoImpl;
import board.model.dto.BoardDto;
import user.dto.userDto;

@WebServlet("/board")
public class boardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// dao 가져오기
	BoardDao boardDao = BoardDaoImpl.getDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		switch (action) {
		case "insertBoard":
			doInsertBoard(request, response);
			break;

		case "getlistBoard":
			doGetlistBoard(request, response);
			break;

		case "searchBoard":
			doSearchBoard(request, response);
			break;

		case "updateBoard":
			doUpdateBoard(request, response);
			break;

		case "deleteBoard":
			doDeleteBoard(request, response);
			break;
		}
	}

	private void doInsertBoard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		userDto entity = (userDto) session.getAttribute("logOK");
		String user_id = entity.getId();
		BoardDto dto = new BoardDto(request.getParameter("title"), request.getParameter("content"), user_id);

		int res = boardDao.insertBoard(dto);
		System.out.println("res : " + res);
		if (res > 0) {
			response.sendRedirect(request.getContextPath() + "/board?action=getlistBoard");
		}

	}

	private void doGetlistBoard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BoardDto> list = BoardDaoImpl.getDao().getlistBoard();

		if (list != null) {
			RequestDispatcher rd = request.getRequestDispatcher("board/post.jsp");
			request.setAttribute("boardlist", list);
			request.setAttribute("checkbox", "true");
			rd.forward(request, response);
		}
	}

	private void doSearchBoard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BoardDto> list = boardDao.getlistBoard();
		request.setAttribute("boardlist", list);

		request.getRequestDispatcher("#").forward(request, response);
	}

	private void doUpdateBoard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDto dto = new BoardDto(Integer.parseInt(request.getParameter("article_no")), request.getParameter("title"),
				request.getParameter("content"), request.getParameter("user_id"),
				Integer.parseInt(request.getParameter("hit")), request.getParameter("register_time"));
		int res = boardDao.updateBoard(dto);
		if (res > 0) {
			// response.sendRedirect : 이전까지 기록한 요청이 초기화 (특정 url로 재요청)
			// getRequestDispatcher().forward(request, response) : 스택에 쌓이듯이 데이터가 기록에 남는다. (페이지 출력, 페이지 전환)
			
			// 참고할 만한 사이트 : https://u-it.tistory.com/entry/%ED%8E%98%EC%9D%B4%EC%A7%80%EC%B6%9C%EB%A0%A5-%ED%8E%98%EC%9D%B4%EC%A7%80%EC%A0%84%ED%99%98-%EB%B0%8F-%ED%8A%B9%EC%A0%95-url%EB%A1%9C-%EC%9E%AC-%EC%9A%94%EC%B2%AD-%EC%9D%84-%ED%95%B4%EC%A3%BC%EB%8A%94-RequestDispatcher-%EC%9D%98-requestgetRequestDispatcherforward-HttpServletResponse%EC%9D%98-responsesendRedirect
			response.sendRedirect(request.getContextPath() + "/board?action=getlistBoard");
		}
	}

	private void doDeleteBoard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDto dto = new BoardDto();
		dto.setArticle_no(Integer.parseInt(request.getParameter("article_no")));
		int res = BoardDaoImpl.getDao().deleteBoard(dto);
		if (res > 0) {
			
			response.sendRedirect(request.getContextPath() + "/board?action=getlistBoard");
		}

	}


}
