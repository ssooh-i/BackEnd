<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../menu.jsp" %>

<form action="/log/login"  method="post">
	<input type="hidden" name="action" value="login">
	<table border="0" align="center" width="350">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인">
				<input type="reset" value="취&nbsp;&nbsp;소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>


















