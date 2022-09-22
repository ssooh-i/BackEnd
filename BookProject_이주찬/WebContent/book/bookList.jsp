<%@page import="java.util.List"%>
<%@page import="com.book.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../menu.jsp" %>
<% List<BookDTO> list = (List<BookDTO>)request.getAttribute("bookList"); %>
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
<% for(BookDTO book : list) { %>
			<tr>
				<td><%=book.getIsbn() %></td>
				<td><%=book.getTitle() %></td>
				<td><%=book.getAuthor() %></td>
				<td><%=book.getCompany() %></td>
				<td><%=String.format("%,d",book.getPrice()) %>원</td>
				<td>
					<form action="<%=root %>/book/bookUpdate.jsp" method="post">
						<input type="hidden" name="isbn" value="<%=book.getIsbn() %>">
						<input type="hidden" name="title" value="<%=book.getTitle() %>">
						<input type="hidden" name="author" value="<%=book.getAuthor() %>">
						<input type="hidden" name="company" value="<%=book.getCompany() %>">
						<input type="hidden" name="price" value="<%=book.getPrice()%>">
						<input type="submit" value="수정">						         
					</form>
				</td>
				<td>
					<form action="<%=root %>/main" method="post">
						<input type="hidden" name="action" value="delBook">
						<input type="hidden" name="isbn" value="<%=book.getIsbn()%>">
						<input type="submit" value="삭제" onclick="return confirm('삭제할까요?')">	
					</form>
				</td>
			</tr>		
<% } %>
		</table>

</body>
</html>