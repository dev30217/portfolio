<%@page import="dao.VaccineDAO"%>
<%@page import="vo.CustVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/dev/header.jsp"%>
<%
VaccineDAO dao =  new VaccineDAO();
ArrayList<CustVO> list = dao.getCustList();
if (!list.isEmpty()) {
%>
<h1>회원 리스트</h1>
<table border="1">
	<tr>
		<td>회원코드</td>
		<td>회원이름</td>
		<td>생년월일</td>
		<td>전화번호</td>
		<td>성별</td>
		<td>도시코드</td>
	</tr>
	<%
	for (CustVO vo : list) {
	%>
	<tr>
		<%
		//String 클래스의 인스턴스는 한 번 생성되면 그 값을 읽기만 할 수 있고, 변경할 수는 없습니다.
		//하지만 StringBuffer 클래스의 인스턴스는 그 값을 변경할 수도 있고, 추가할 수도 있습니다.
	
		StringBuffer birth = new StringBuffer();
		birth.append(vo.getCust_birth());//값추가
		birth.insert(4, "년");//해당 인덱스(4)에 "년"을 추가
		birth.insert(7, "월");
		birth.insert(10, "일");

		String city = vo.getCity();//vo값 가져옴
		switch (city) {
		case "10":
			city = "경기";//만약 갸져온 값이 "10"일경우 값을 "경기"로 바꿔줌
			break;
		case "20":
			city = "서울";
			break;
		case "30":
			city = "부산";
			break;
		case "40":
			city = "대구";
			break;
		}
		%>
		<td><%=vo.getCust_id()%></td>
		<td><%=vo.getCust_name()%></td>
		<td><%=birth%></td>
		<td><%=vo.getCust_tel1()%>-<%=vo.getCust_tel2()%>-<%=vo.getCust_tel3()%></td>
		<td><%=vo.getCust_gender()%></td>
		<td><%=city%></td>
	</tr>
	<%
	}
	%>
</table>
<%
} else {
%>
null
<%
}
%>
<%@ include file="/dev/footer.jsp"%>