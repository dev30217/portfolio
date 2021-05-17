<%@page import="java.sql.Date"%>
<%@page import="dao.VaccineDAO"%>
<%@page import="vo.OrderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		int i_code = Integer.parseInt(request.getParameter("i_code"));
		String v_code = request.getParameter("v_code");
		String cust_id = request.getParameter("cust_id");
		Date i_date = Date.valueOf(request.getParameter("i_date"));

		OrderVO vo = new OrderVO();
		vo.setI_code(i_code);
		vo.setV_code(v_code);
		vo.setCust_id(cust_id);
		vo.setI_date(i_date);

		VaccineDAO dao = new VaccineDAO();

		int n = dao.InsertVaccine(vo);

		if (n > 0) {
	%>
	<script type="text/javascript">
		alert("등록이 완료되었습니다");
	</script>
	<%
		response.sendRedirect("/index.jsp");
		} else {
	%>
	<script type="text/javascript">
		alert('실패');
	</script>

	<%
		}
	%>

</body>
</html>