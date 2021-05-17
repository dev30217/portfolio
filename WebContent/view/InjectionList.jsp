<%@page import="vo.InjectionVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VaccineDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/dev/header.jsp"%>
<h1>주사 접종 리스트</h1>
<%
VaccineDAO dao = new VaccineDAO();

ArrayList<InjectionVO> list = dao.getInjectionList();

if (!list.isEmpty()) {
%>
<table>
	<tr>
		<td>접종코드</td>
		<td>회원코드</td>
		<td>회원이름</td>
		<td>백신코드</td>
		<td>백신이름</td>
		<td>접종날짜</td>
	</tr>
	<%
	for (InjectionVO vo : list) {;
		String sb  = String.valueOf(vo.getI_code());
		StringBuilder s = new StringBuilder(sb);
		s.insert(4, '-');
		
	%>
	<tr>
		<td><%=s%></td>
		<td><%=vo.getCust_id()%></td>
		<td><%=vo.getCust_name()%></td>
		<td><%=vo.getV_code()%></td>
		<td><%=vo.getV_name()%></td>
		<td><%=vo.getI_date()%></td>
	</tr>

	<%
}
%>
</table>
<%
}else{
	%>	
	없음
<% 	
}
%>




<%@ include file="/dev/footer.jsp"%>