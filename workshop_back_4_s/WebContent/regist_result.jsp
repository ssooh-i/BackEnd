<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 결과</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid black;
}

th:nth-child(1) {
	width: 100px;
}
</style>
</head>
<body>
    <c:import url="/include/header.jsp"/>
	<h1>도서 등록 결과</h1>
	<c:if test="${!empty book}">
		<h2>등록 도서 정보</h2>
		<table>
			<thead>
				<tr>
					<th>항목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>도서번호</td>
					<td>${book.isbn}</td>
				</tr>
				<tr>
					<td>도서명</td>
					<td>${book.title}</td>
				</tr>
				<tr>
					<td>저자</td>
					<td>${book.author}</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${book.price}</td>
				</tr>
				<tr>
					<td>설명</td>
					<td>${book.desc}</td>
				</tr>
			</tbody>
		</table>
	</c:if>
	<%-- c:if 태그를 이용해 request 영역에 book이 없다면 정보가 없음을 출력한다. --%>
	<c:if test="${empty book }">
		<p>등록된 도서가 없습니다.</p>
	</c:if>
	
	<a href="regist.jsp">추가등록</a>
</body>
</html>