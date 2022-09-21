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
	<fmt:requestEncoding value="UTF-8" />
	${title}
	<table border = "1" width="200px">
		<tr>
			<td>이름</td>
			<td>연락처</td>
		</tr>
	<c:forEach items="${list}" var="ob">
		<tr>
			<td>${ob.name}</td>
			<td>${ob.phone}</td> <!-- ob.name == ob.getName과 동일, getter -->
		</tr>
	</c:forEach>
	</table>

	<br>
	<br>

	<button>
		<a href="/index.html">뒤로</a>
	</button>
</body>
</html>