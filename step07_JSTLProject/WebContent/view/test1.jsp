<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	${title} <br>
	이름: ${irum} <br>
	나이: ${nai} <br>
	<br>
	<br>
	
	<button>
		<a href="/index.html">뒤로</a>
	</button>
	
</body>
</html>

<!-- 
<body>
	<%-- <%
		String title = (String) request.getAttribute("title");
		String name = (String) request.getAttribute("irum");
		int age = (int) request.getAttribute("nai");
	%>
	
	<%=title %> <br>
	이름: <%=name %> <br>
	나이: <%=age %> <br> --%>
	
	<br>
	<br>
	
	<button>
		<a href="/index.html">뒤로</a>
	</button>
	
</body>

 -->