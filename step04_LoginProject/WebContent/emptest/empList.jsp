<%@page import="com.ssafy.dto.EmpDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../menu.jsp"%>
<%
	List<EmpDTO> list = (List<EmpDTO>)request.getAttribute("emplist");
	if(list != null)
	{
%>
		<table border="1" align="center" width="500">
			<tr>
				<td>사원번호</td>
				<td>사원이름</td>
				<td>연락처</td>
				<td>부서</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
<%
			for(EmpDTO ob: list)
			{
%>
			<tr>
				<td><%=ob.getEno()%></td>
				<td><%=ob.getEname()%></td>
				<td><%=ob.getPhone()%></td>
				<td><%=ob.getDept()%></td>
				<td>
					<form action="<%=root%>/emptest/empUpdate.jsp" method="post">
						<input type="hidden" name="eno" value="<%=ob.getEno()%>">
						<input type="hidden" name="ename" value="<%=ob.getEname()%>">
						<input type="hidden" name="phone" value="<%=ob.getPhone()%>">
						<input type="hidden" name="dept" value="<%=ob.getDept()%>">
						<input type="submit" value="수정">						         
					</form>
				</td>
				<td>
					<form action="<%=root%>/emp" method="post">
						<input type="hidden" name="action" value="deleteEmp">
						<input type="hidden" name="eno" value="<%=ob.getEno()%>">
						<input type="submit" value="삭제" onclick="return confirm('삭제할까요?')">						         
					</form>
				</td>
			</tr>
<%
			}//end for
%>					
		</table>
<%
	} //end if
%>		
</body>
</html>







