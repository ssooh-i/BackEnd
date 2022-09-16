<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
    <!-- errorPage="error.jsp"를 설정해서 에러페이지 지정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int a =5;
	int b = 0;
%>
<h3>
*** a와 b의 사칙연산 *** <br><br>
a+b = <%= a+b %><br>
a-b = <%= a-b %><br>
a*b = <%= a*b %><br>
a/b = <%= a/b %><br>
</h3>
</body>
</html>