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
	<h1>다 사자!</h1>
	<form method="post" action="/보충/cartServlet">
		<input type="text" name ="product" placeholder="사고 싶은거">
		<input type="submit" value="담기">
	</form>
	
	<h1>장바구니</h1>
	<div>
		<c:if test ="${empty cart }">
		아직 장바구니에 담긴 게 없엉
		</c:if>
		<c:if test ="${!empty cart }">
			${cart}
		</c:if>
		
	</div>
	
	<a href="/보충/cartServlet">구매하기</a>
	
</body>
</html>