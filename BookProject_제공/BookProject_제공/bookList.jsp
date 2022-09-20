<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<table border="1" align="center" width="600">
			<tr>
				<td>도서코드</td>
				<td>책이름</td>
				<td>저자</td>
				<td>출판사</td>
				<td>가격</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>

			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>
					<form action="/bkshop/book/bookUpdate.jsp" method="post">
						<input type="hidden" name="isbn" value="1">
						<input type="hidden" name="title" value="2">
						<input type="hidden" name="author" value="3">
						<input type="hidden" name="company" value="4">
						<input type="hidden" name="price" value="4">
						<input type="submit" value="수정">						         
					</form>
				</td>
				<td>
					<form action="/bkshop/deleteBook" method="post">
						<input type="hidden" name="isbn" value="1">
						<input type="submit" value="삭제" onclick="return confirm('삭제할까요?')">	
					</form>
				</td>
			</tr>		

		</table>

</body>
</html>