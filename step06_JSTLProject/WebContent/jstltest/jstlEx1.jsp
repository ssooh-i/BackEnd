<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 밑줄 뜨면 라이브러리가 없는것, webcontent>web-inf> lib> jstl-1.2.jar추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value ="utf-8"/> <!-- 앞으로는 이걸로 한글설정 -->
<form action = "jstlEx1.jsp" method = "post">
	이름: <input type = "text" name = "irum" value ="${param.irum}">
	<input type ="submit" value ="확인">
	 
</form>
나의 이름은 <b>${param.irum}</b>입니다.
</body>
</html>