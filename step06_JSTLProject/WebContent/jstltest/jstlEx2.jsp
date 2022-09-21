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


<%
	String[] color = {"red", "green", "blue"};	
%>
<!-- varStatus 상태변수(count, index, current 등 사용가능) -->
<c:forEach items="<%=color %>" varStatus="i">
	${i.count}&nbsp;&nbsp;&nbsp;${i.current}<br>
</c:forEach>

<c:forTokens items="벤츠,소나타,아우디,포르쉐,BMW" delims="," var = "car">
	${car}&nbsp;&nbsp;&nbsp;
</c:forTokens><br><br>

<c:forEach begin ="1" end ="10" step="1" var ="num">
${num}&nbsp;&nbsp;&nbsp;
</c:forEach>

<c:set var = "num1" value="${10}"/> <!-- int num1 = 10; 과 동일 -->
<c:set var = "num2"> 20</c:set>
num1+num2 = ${num1+num2} <br><br>
</body>
</html>