<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<%@include file="/session/check_session.jsp"  %> 
</head>
<body>
<%
	


%>
	
	<h1 align="center"> 회원 탈퇴</h1>
	<form action="deletePro.jsp" method="post">
		<table>
			<tr>
				<td >회원 탈퇴를 원하시면 비밀번호를 입력하세요</td>
				<td><input type="password"  name="pw"/></td>
			</tr>
			<tr>
				<td><input type="submit"  value="회원탈퇴"/></td>
				<td><input type="button"  value="취소"  onclick="history.go(-1);"/></td>
			</tr>
			
		</table>
	
	</form>




</body>
</html>