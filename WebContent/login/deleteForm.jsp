<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>회원 탈퇴</title>
<%@include file="/session/check_session.jsp"  %> 
</head>
<body>
<%
%>
	<div class="container">
	<h1 align="center" style="margin-top:30px;"> 회원 탈퇴</h1>
	<!-- 회원 탈퇴 폼 -->
	<form action="deletePro.jsp" method="post" style="margin-top:30px;"> <!-- deletePro.jsp페이지로 이동 -->
		<table class="table " >
			<tr>
				<td >회원 탈퇴를 원하시면 비밀번호를 입력하세요</td>
				<td><input type="password"  name="pw"/></td> <!-- 비밀번호 -->
			</tr>
			<tr>
				<td colspan="2" >
					<div class="float-right">
					<input type="submit"  value="회원탈퇴" class="btn btn-primary"/>
					<input type="button"  value="취소"   class="btn btn-primary" onclick="history.go(-1);"/>
					</div>
				</td>
			</tr>
			
		</table>
	
	</form>
	</div>




</body>
</html>