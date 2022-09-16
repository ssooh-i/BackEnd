<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="JSP Progaminig을 공부하는 중" %>
<%@ page import="java.util.*"%> <!-- import는 여러번 선언 가능 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= getServletInfo() %>
<%
	Calendar cal=Calendar.getInstance();
	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	int day=cal.get(Calendar.DAY_OF_MONTH);
	
	Random rd=new Random();
	int per=rd.nextInt(101); 
%>
오늘 날짜: <%=year%>년  <%=month%>월  <%=day%>일<br>
오늘 운세: <%=per%>퍼센트

</body>
</html>