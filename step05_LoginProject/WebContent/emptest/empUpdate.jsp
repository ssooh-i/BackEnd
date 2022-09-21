<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../menu.jsp"/>

<c:set var = "root" value="${pageContext.request.contextPath}" />
<form action="${root}/emp" method="post">

<input type="hidden" name="action" value="updateemp">
<table border="0" width="300" align="center">
	<tr>
		<td>사원번호</td>
		<td><input type="text" name="eno" value="${param.eno}" readonly></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="ename" value="${param.ename}" readonly></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone" value="${param.phone}"></td>
	</tr>
	<tr>
		<td>부서명</td>
		<td><input type="text" name="dept" value="${param.dept}"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정하기">
			<input type="reset" value="취소하기">
		</td>
	</tr>
</table>
</form>
</body>
</html>