<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form action="" method="post">
<table border="0" width="300" align="center">
	<tr>
		<td>도서코드</td>
		<td><input type="text" name="isbn" value="" readonly></td>
	</tr>
	<tr>
		<td>책이름</td>
		<td><input type="text" name="title" value="" readonly></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><input type="text" name="author" value="" readonly></td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><input type="text" name="company" value="" readonly></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price" value=""></td>
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