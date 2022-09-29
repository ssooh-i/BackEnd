<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user_id = "";
String password = "";
// 만약 id, password를 입력하지 않았을 때
if(request.getParameter("user_id") == ""){%>
	<script>
		alert("아아디를 입력하세요.");
		// 이전 페이지로 이동하기
		history.back();
	</script>
<%} else{
	// 아이디, 비밀번호를 데이터베이스에서 가져온다.
	user_id = request.getParameter("user_id"); // ID 값을 가져온다.
	// DB를 연결하는 코드
	Connection conn = null;
	String driverName = "com.mysql.cj.jdbc.Driver";
	Class.forName(driverName);
	String url = "jdbc:mysql://localhost:3306/ssafyschema?serverTimezone=UTC";
	String user = "ssafy";
	String pass = "ssafy";
	conn = DriverManager.getConnection(url, user, pass);
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from members where user_id = '" + user_id + "'");

	Boolean check = false;
	
	while(rs.next()){ // 결과 값을 하나씩 가져와서 저장하기 위한 while 문이다.
		password = rs.getString("user_password"); // DB에 있는 password가져옴
    	session.setAttribute("user_password", password); // DB값을 세션에 넣음
		check = true;
	}
	if(check){ // id와 password가 존재하는 경우 게시판으로 이동
	%>
	<script>
	alert("비밀번호 : " + <%=password%> + " 입니다.");
	document.location.href="../index.jsp";
	</script>
	<%
		out.print("실행됨");
		rs.close();
		conn.close();
	}else{ // id와 password가 일치하지 않는 경우%>
	<script>
		alert("id를 잘못 입력하셨습니다.");
		history.back();
	</script>
	<%}
}%>

</body>
</html>