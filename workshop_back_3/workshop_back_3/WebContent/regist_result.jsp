<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ssafy.backend.dto.*"%>
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
    <%@ include file="/include/header.jsp"%>
	<h1>도서 등록 결과</h1>
	<%
		Object bookObj = request.getAttribute("book");
		if (bookObj != null) {
			Book book = (Book) bookObj;
	%>
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
				<td><%=book.getIsbn()%></td>
			</tr>
			<tr>
				<td>도서명</td>
				<td><%=book.getTitle()%></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><%=book.getAuthor()%></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><%=book.getPrice()%></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><%=book.getDesc()%></td>
			</tr>
		</tbody>
	</table>
	<%
		} else {
	%>
	<p>등록된 도서가 없습니다.</p>
	<%
		}
	%>
	<a href="regist.html">추가등록</a>
</body>
</html>