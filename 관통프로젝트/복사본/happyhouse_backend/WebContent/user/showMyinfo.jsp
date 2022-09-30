<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="user.dto.userDto" %>
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
	<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous">
  	</script>
	<link rel="stylesheet" href="css/login.css">
</head>

<body>
<%
	userDto user=(userDto)session.getAttribute("userinfo");
%>
	<div class="wrap">
		<div class="login">
			<h2>My-info</h2>
			<form action="${root}/user/updateUser.jsp" method="post">
			<input type="hidden" name="action" value="update">
				<div class="login_id">
					<h4>Id</h4>
					<input type="text" name="user_id" value="<%=user.getId()%>" readonly>
				</div>
				<div class="login_pw">
					<h4>Password</h4>
					<input type="text" name="user_password" value="<%=user.getPwd()%>" readonly>
				</div>
				<br>
				<div class="login_pw">
					<h4>Name</h4>
					<input type="text" name="user_name" value="<%=user.getName()%>" readonly>
				</div>
				<div class="submit">
					<input type="submit" value="modify">
				</div>
				<div class="submit">
					<input type="button" value="OK" onClick="location.href='index.jsp'" >
				</div>
			</form>
		</div>
	</div>
</body>



</html>