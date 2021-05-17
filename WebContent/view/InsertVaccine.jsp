<%@page import="dao.VaccineDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/dev/header.jsp"%>
<h1>주사접종등록</h1>

<form name="frm" method="post" action="/view/InsertVaccinePro.jsp">
	<table>
		<tr>
			<td>접종받은 코드</td>
			<td><input type="text" id="i_code" name="i_code"></td>
		</tr>
		<tr>
			<td>백신 코드</td>
			<td><input type="text" id="v_code" name="v_code"></td>
		</tr>
		<tr>
			<td>회원 코드</td>
			<td><input type="text" id="cust_id" name="cust_id"></td>
		</tr>
		<tr>
			<td>접종 날짜</td>
			<td><input type="date" id="i_date" name="i_date"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" onclick="return checkFrm()"
				value="가입"> <input type="reset" value="다시쓰기"
				onclick="alert('다시 쓰기!')"></td>
		</tr>
	</table>
</form>
<script>
	function checkFrm() {
		if (document.frm.i_code.value.trim() == "") {
			alert('접종받은 코드가 비어있음!');
			return false;
		}
		if (document.frm.v_code.value.trim() == "") {
			alert('백신 코드가 비어있음!');
			return false;
		}
		if (document.frm.cust_id.value.trim() == "") {
			alert('회원 코드가 비어있음!');
			return false;
		}
		if (document.frm.i_date.value.trim() == "") {
			alert('접종 날짜가 비어있음!');
			return false;
		} else {
			document.frm.submit();
		}
	}
</script>
<%@ include file="/dev/footer.jsp"%>
