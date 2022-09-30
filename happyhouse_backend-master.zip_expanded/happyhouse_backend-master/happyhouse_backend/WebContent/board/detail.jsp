<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>write</title>

<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	$(document)
			.on(
					'click',
					'#btnList',
					function(e) {
						e.preventDefault();
						location.href = "${pageContext.request.contextPath}/board/getBoardList";
					});
</script>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
</head>

<body style="background-color: rgba(0, 85, 85, 1)">

	<article>
		<div class="container" role="main">
			<h1 style="color: rgb(255, 255, 255)">Write a notice</h1>
			<hr style="background-color: rgb(255, 255, 255)">
			<form name="form" id="form" role="form" method="post"
				action="${pageContext.request.contextPath}/board?action=updateBoard">
				<input type="hidden" name="action" value="updateBoard">
				<input type="hidden" name="article_no" value="<%=request.getParameter("article_no")%>">
				<input type="hidden" name="user_id" value="${article.user_id}">
				<div class="mb-3">
					<label for="title" style="color: rgb(255, 255, 255)" >제목</label>
					<input type="text" class="form-control" name="title" id="title"
						value="<%=request.getParameter("title") %>">
				</div>
				<hr>
				<div class="mb-3">
					<label for="content" style="color: rgb(255, 255, 255)" >내용</label>
					<textarea class="form-control" rows="5" name="content" id="content"><%=request.getParameter("content")%></textarea>
				</div>
			
			<div>
				<input type="submit" value="수정">
			</div>
			</form>
		</div>
	</article>
</body>
</html>