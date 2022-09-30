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
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous">
  </script>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>
	<div class="wrap">
		<div class="login">
			<h2>update</h2>
			<form action="${root}/user" method="post">
				<input type="hidden" name="action" value="update">
				<div class="login_id">
					<h4>Id</h4>
					<input type="text" name="user_id" value="<%=request.getParameter("user_id") %>" readonly>
				</div>
				<div class="login_pw">
					<h4>Password</h4>
					<input type="text" name="user_password" value="<%=request.getParameter("user_password") %>">
				</div>
				<div class="login_pw">
					<h4>Name</h4>
					<input type="text" name="user_name" value="<%=request.getParameter("user_name") %>">
				</div>
				<div class="submit">
					<input type="submit" value="update">
				</div>
				<div class="submit">
					<input type="button" value="cancel" onClick="location.href='../index.jsp'" >
				</div>
			</form>
		</div>
	</div>
</body>
</html>