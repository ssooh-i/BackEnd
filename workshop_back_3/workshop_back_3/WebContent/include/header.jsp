<%@page import="com.ssafy.backend.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#title {
	text-align: center;
}

#user-info {
	text-align: right;
}
</style>

<h1 id="title">SSAFY 도서 관리</h1>
<div id="user-info">
<%
	Object userObj=session.getAttribute("loginUser");
	User user = userObj==null ? null: (User)userObj;
	if(user == null){
%>
	<form method="post" action="main">
		<input type="hidden" name="action" value="login"> 
		<input type="text" name="id" placeholder="아이디"> 
		<input type="password" name="pass" placeholder="비밀번호"> 
		<input type="submit" value="로그인">
	</form>
<%
	}else{
%>
	<div>
		<%=user.getName()%>님 반갑습니다 <a href="main?action=logout">로그아웃</a>
	</div>
<%		
	}
%>	
</div>	
<hr>
<script>
	let msg="<%=request.getAttribute("msg") ==null?"": request.getAttribute("msg") %>";
	if(msg){
		alert(msg);
	}
</script>







