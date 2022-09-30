<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// 기존의 세션 데이터를 모두 삭제한다.
	session.invalidate();

	// 로그인 페이지로 이동시킨다.
	response.sendRedirect("../index.jsp");
%>

</body>
</html>