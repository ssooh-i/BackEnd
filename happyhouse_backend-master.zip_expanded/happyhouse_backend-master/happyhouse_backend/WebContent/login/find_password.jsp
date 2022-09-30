<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous">
	
</script>
<link rel="stylesheet" href="/hh/css/login.css">
</head>
<body>
	<div class="wrap">
		<div class="login">
			<h2>찾으시려는 id를 입력하세요.</h2>
			<form action="/hh/user" method="post" id="loginForm">
				<input type="hidden" name="action" value="idcheck">
				<div class="login_id">
					<input type="text" placeholder="아이디" name="user_id">
				</div>
				<div class="submit">
					<input type="submit" value="login">
				</div>
			</form>
		</div>
	</div>
	<c:if test="${msg ne null}">
	
	<script>
		alert("${msg}");
	</script>
	
	</c:if>
	



</body>
</html>