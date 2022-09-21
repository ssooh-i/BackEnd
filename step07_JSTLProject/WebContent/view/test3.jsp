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
	<c:forEach items="${color}" var="ob">
	${ob}<br>
	</c:forEach>
	
	<c:forEach begin="1" end="${num}" var="num">
	${num}&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<br>
	<br>

	<button>
		<a href="/index.html">뒤로</a>
	</button>
</body>
</html>