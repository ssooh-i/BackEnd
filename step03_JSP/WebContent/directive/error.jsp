<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <!-- 디폴트가 isErrorPage="false"여서 true로 바꿔주면 에러페이지로 쓰겠다는 거 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
다음과 같은 에러가 발생했습니다<br>
<%=exception.getMessage() %>
</body>
</html>