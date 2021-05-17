<%@page import="dao.VaccineDAO"%>
<%@page import="vo.CountVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/dev/header.jsp"%>
<%
	VaccineDAO dao = new VaccineDAO();
	ArrayList<CountVO> list = dao.getCountList();

	if (!list.isEmpty()) {
%>
<h1>백신별 접종 목록</h1>
<table>
	<tr>
		<td>백신 코드</td>
		<td>백신 이름</td>
		<td>접종 수</td>

	</tr>
	<%
		for (CountVO vo : list) {
	%>
	<tr>
		<td><%=vo.getV_code()%></td>
		<td><%=vo.getV_name()%></td>
		<td><%=vo.getCount()%></td>

	</tr>

	<%
		}
	%>
</table>
<%
	}
%>


<%@ include file="/dev/footer.jsp"%>