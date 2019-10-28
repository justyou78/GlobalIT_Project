<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	border: 1px solid black;
	margin-left: auto;
	margin-right: auto;
}

td {
	border: 1px dotted lime;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	
</script>

</head>

<body>
	<form action="joinPro.jsp" method="post" name="userinput">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"/> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"/></td>
				
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwCheck"/></td>
				
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="callnumber"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"  value="회원가입"/></td>
			</tr>
			
			
		</table>
	</form>



</body>
</html>