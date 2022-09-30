<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/style.css" />

<title>Post</title>
<style type="text/css">
body {
	margin: 30px 0px;
}

ul {
	list-style: none;
	font-style: italic;
	font-weight: bold;
}

.items {
	float: left;
	margin: 0px 20px;
}
a {
  text-decoration-line: none;
  color: white;
  }
  
#page-items{
color: black;
}  
</style>
</head>

<body style="background-color: rgba(0, 85, 85, 1)">
	<header class="header">
		<div class="container"
			style="background: #005555; padding-bottom: 10px; padding-top: 10px">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<ul
						class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li class="items"><a href="logout/logout.jsp">Log Out</a></li>
					</ul>
				</div>
			</div>
			<div class="title" style="color: white">
				<h2 style="font-weight: bold"><a href="./index.jsp">HAPPY HOUSE</a></h2>
			</div>
		</div>
	</header>

	<div class="row justify-content-center">
		<div class="col-lg-8 col-md-10 col-sm-12">
			<h2 class="my-3 py-3 text-center">
				<p style="color: white; font-weight: bold;">Notice</p>
			</h2>
		</div>
		<div class="col-lg-8 col-md-10 col-sm-12">
			<div class="row align-self-center mb-2">
				<div class="col-md-2 text-start">
					<button type="button" id="btn-mv-register"
						class="btn btn-dark btn-sm" onclick="location.href='board/write.jsp'">글쓰기</button>
				</div>
				<div class="col-md-7 offset-3">
					<form class="d-flex" id="form-search" method="get" action="">
						<input type="hidden" name="act" value="list"> <input
							type="hidden" name="pgno" value="1"> <select
							class="form-select form-select-sm ms-5 me-1 w-50" name="key"
							aria-label="검색조건">
							<option value="" selected>검색조건</option>
							<option value="subject">제목</option>
							<option value="userid">작성자</option>
						</select>
						<div class="input-group input-group-sm">
							<input type="text" class="form-control" name="word"
								placeholder="검색어..." /> <span>&nbsp;</span>
							<button id="btn-search" class="btn btn-dark" type="button">검색</button>
						</div>
					</form>
				</div>
			</div>
			<table class="table table-hover" style="background: white;">
				<thead>
					<tr class="text-center">
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">내용</th>
						<th scope="col">수정</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${boardlist}">
						<tr class="text-center">
						
							<th scope="row">${article.article_no}</th>
							<td> ${article.title} </td>
							<td>${article.user_id}</td>
							<td>${article.content}</td>
							<td>
								<form action="<%=root %>/board/detail.jsp" method="post">
									<input type="hidden" name="article_no" value="${article.article_no}">
									<input type="hidden" name="title" value="${article.title}">
									<input type="hidden" name="user_id" value="${article.user_id}">
									<input type="hidden" name="content" value="${article.content}">
									<input type="submit" value="수정">			         
								</form>
							</td>
							
							<td>
								<form action="<%=root %>/board?action=deleteBoard" method="post">
									<input type="hidden" name="article_no" value="${article.article_no}">
									<input type="submit" value="삭제">	
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">이전</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</div>
	</div>
	</div>
	<form id="form-no-param" method="get" action="${root}/board">
		<input type="hidden" id="act" name="act" value="view">
		<input type="hidden" id="pgno" name="pgno" value="${pgno}">
		<input type="hidden" id="key" name="key" value="${key}">
		<input type="hidden" id="word" name="word" value="${word}">
		<input type="hidden" id="articleno" name="articleno" value="">
	</form>
</body>

<c:if test="${true ne checkbox}">
<script>
	document.location.href="/hh/board?action=getlistBoard"
</script>
</c:if>





</html>
