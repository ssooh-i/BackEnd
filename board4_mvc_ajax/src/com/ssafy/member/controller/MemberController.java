package com.ssafy.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mysql.cj.xdevapi.JsonArray;
import com.ssafy.member.model.MemberDto;
import com.ssafy.member.model.service.MemberService;
import com.ssafy.member.model.service.MemberServiceImpl;

@WebServlet("/user")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService;

	public void init() {
		memberService = MemberServiceImpl.getMemberService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String act = request.getParameter("act");
		System.out.println("act ==== " + act);

		String path = "/index.jsp";
		if ("mvjoin".equals(act)) {
			path = "/user/join.jsp";
			redirect(request, response, path);
		} else if ("idcheck".equals(act)) {
			int cnt = idCheck(request, response);
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(cnt);
		} else if ("join".equals(act)) {
			path = join(request, response);
			forward(request, response, path);
		} else if ("mvlogin".equals(act)) {
			path = "/user/login.jsp";
			redirect(request, response, path);
		} else if ("login".equals(act)) {
			path = login(request, response);
			forward(request, response, path);
		} else if ("logout".equals(act)) {
			path = logout(request, response);
			forward(request, response, path);
		} else if ("memberlist".equals(act)) {
			path = memberList(request, response);
			forward(request, response, path);
		} else if ("memberjson".equals(act)) {
			try {
				memberJson(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("mydata".equals(act)) {
			try {
				myData(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			redirect(request, response, path);
		}
	}

	// -----------------------------------------------------------------------------------
	private void myData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberDto sid = (MemberDto) session.getAttribute("userinfo");
		MemberDto dto = memberService.getUserMember(sid.getUserId());
		

		Map<String, String> map = new HashMap<>();

		map.put("userid", dto.getUserId());
		map.put("username", dto.getUserName());
		map.put("email", dto.getEmailId() + "@" + dto.getEmailDomain());
		map.put("joindate", dto.getJoinDate());

		JSONObject obj = new JSONObject(map);

		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(JSONObject.toJSONString(obj));
	}

	private void memberJson(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<MemberDto> list = memberService.listMember();

		JSONArray array = new JSONArray(); // json-simple-1.1.1.jar 추가
		Map<String, String> map = new HashMap<>();
		for (MemberDto dto : list) {
			map.put("userid", dto.getUserId());
			map.put("username", dto.getUserName());
			map.put("email", dto.getEmailId() + "@" + dto.getEmailDomain());
			map.put("joindate", dto.getJoinDate());

			JSONObject obj = new JSONObject(map);
			array.add(obj);
		}
		// System.out.println(JSONArray.toJSONString(array));

		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(JSONArray.toJSONString(array));
	}

	private String memberList(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<MemberDto> list = memberService.listMember();
			request.setAttribute("memberlist", list);
			return "/user/memberlist.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "회원 목록 처리중 에러 발생!!!");
			return "/error/error.jsp";
		}
	}

	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
//		session.removeAttribute("userinfo");
		session.invalidate();
		return "/index.jsp";
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userid");
		String userPwd = request.getParameter("userpwd");
		try {
			MemberDto memberDto = memberService.loginMember(userId, userPwd);
			if (memberDto != null) { // 로그인 성공(id, pwd 일치!!!!)

				String saveid = request.getParameter("saveid");
				if ("ok".equals(saveid)) { // 아이디 저장 체크 O.
					Cookie cookie = new Cookie("ssafy_id", userId);
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);
					cookie.setPath(request.getContextPath());

					response.addCookie(cookie);
				} else {
					Cookie[] cookies = request.getCookies();
					if (cookies != null) {
						for (Cookie cookie : cookies) {
							if (cookie.getName().equals("ssafy_id")) {
								cookie.setMaxAge(0);
								cookie.setPath(request.getContextPath());

								response.addCookie(cookie);
								break;
							}
						}
					}
				}

				HttpSession session = request.getSession();
				session.setAttribute("userinfo", memberDto);
				String referer = request.getHeader("referer");
				System.out.println(referer);
				return "/index.jsp";
			} else { // 로그인 실패(id, pwd 불일치!!!!)
				request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인!!!");
				return "/user/login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "로그인 처리중 에러 발생!!!");
			return "/error/error.jsp";
		}
	}

	private String join(HttpServletRequest request, HttpServletResponse response) {
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId(request.getParameter("userid"));
		memberDto.setUserName(request.getParameter("username"));
		memberDto.setUserPwd(request.getParameter("userpwd"));
		memberDto.setEmailId(request.getParameter("emailid"));
		memberDto.setEmailDomain(request.getParameter("emaildomain"));
		try {
			memberService.joinMember(memberDto);
			return "/user?act=mvlogin";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "회원 가입 처리중 에러 발생!!!");
			return "/error/error.jsp";
		}
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	private int idCheck(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userid");
		try {
			int count = memberService.idCheck(userId);
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 500;
	}

}
// MIME 타입: https://developer.mozilla.org/ko/docs/Web/HTTP/Basics_of_HTTP/MIME_types