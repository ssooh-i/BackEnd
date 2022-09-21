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
request.setCharacterEncoding("utf-8");
%>
<form action = "elEx2.jsp" method = "post">
	이름: <input type = "text" name = "irum" value ="${param['irum']}">
	<input type ="submit" value ="확인">
	 
</form>
나의 이름은 <b>${param['irum']}</b>입니다.
</body>
</html>

<!-- 
request.getParameter("irum"); 을 EL로 표현하면
=> ${param['irum']} 또는 ${param.irum} 으로 사용함
 -->