<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
</head>

<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous">
	
</script>

<body>

	<c:if test="${msg ne null}">
		<script>
			alert("비밀번호 : ${msg} 입니다. ");
			document.location.href="${root}/index.jsp";
		</script>
		
	</c:if>
</body>
</html>