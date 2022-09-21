<%@page import="com.book.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	p{	color:green;font-weight: bold;	font-size: 30px;}
	body { margin: 0; padding: 0; }
	#menu { height: 100px; background-color: #eee;	}
	a { display:inline-block;  margin-top:40px; text-decoration: none; font: bold;  
	    width: 100px; text-align: center; }
	#login_info { font-size: 12px; }
</style>
</head>
<body>

<% 
	String root = request.getContextPath();
	LoginDTO login = (LoginDTO)session.getAttribute("loginOK");
%>
<div id="menu">
		<a href="<%=root%>/index.jsp">HOME</a>
<% if(login == null)
	{
%>		
		<a href="<%=root%>/login/login.jsp">로그인 화면</a>
<%
	} else {
%>		
		<a href="<%=root%>/book/bookInsert.jsp">도서등록</a>
		<a href="<%=root%>/main?action=bklist">도서목록</a>
		<a href="<%=root%>/main?action=logout">로그아웃</a>
		<span id="login_info"><b><%=login.getUserid() %></b>님이 로그인 하셨습니다</span>
<%
	}
%>
</div>
<hr>
