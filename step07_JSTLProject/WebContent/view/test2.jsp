<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
	${title}<br>
	당신의 점수는 ${score}이고 
	<c:if test = "${score >=60}">
	합격</c:if>
	<c:if test = "${score <60}">
	불합격</c:if>
	하셨습니다.
	
	
	<br>
	<br>

	<button>
		<a href="/index.html">뒤로</a>
	</button>

</body>
</html>