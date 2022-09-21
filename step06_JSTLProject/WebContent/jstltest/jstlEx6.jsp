<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="color" value="${'pupple' }"/>
<c:choose>
	<c:when test="${color=='red'}">빨간색</c:when>
	<c:when test="${color=='gree'}">초록색</c:when>
	<c:when test="${color=='blue'}">파란색</c:when>
	<!-- <c:otherwise>기타색</c:otherwise> 으로 하면 보안에 취약해서 사용 하지 않는다-->
	<c:otherwise><c:out value = '기타색'/></c:otherwise>
</c:choose>
</body>
</html>