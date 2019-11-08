<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="globalit_pro.example.dto.MemberDTO"%>
<%@page import="globalit_pro.example.dao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="/session/check_session.jsp"%>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		/*  세션에 해당하는 정보를 초기화한 MemberDTO */
		MemberDTO dto = new MemberDAO().getUser(sessionID);
	%>

	<div class="container" style="margin-top: 30px;">
		<!-- 회원 정보 수정 Form -->
		<form action="changeInfopro.jsp" method="POST"> <!-- changeInfopro.jsp로 이동 -->
			<h1 class="text-center" style="margin-bottom: 60px;">회원정보수정</h1>
			<table class="table  table-bordered  text-center">

				<tr>
					<td>아이디</td>
					<td><input type="text" value="<%=dto.getId()%>" name="id"
						readonly /></td> <!-- 아이디 -->
				</tr>

				<tr>
					<td>기존비밀번호</td>
					<td><input type="password" value="" name="origin_pw" /></td> <!-- 비밀번호 -->
				</tr>


				<tr>
					<td>이름</td>
					<td><input type="text" value="<%=dto.getName()%>" name="name" /></td> <!-- 이름 -->
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" value="<%=dto.getCallnumber()%>" 
						name="callnumber" /></td> <!-- 전화번호 -->
				</tr>
			</table>
			<div class="float-right">
				<input type="submit" value="수정하기" class="btn btn-secondary" /> 
				<input type="button" value="회원탈퇴" class="btn btn-secondary"
					onclick="window.location='deleteForm.jsp'" /> <!-- 회원 탈퇴 페이지로 이동 --> 
					<input type="button"
					value="비밀번호 수정" class="btn btn-secondary"
					onclick="window.location='password.jsp'" /> <!-- 비밀번호 수정 페이지로 이동 -->
			</div>
		</form>
	</div>

</body>
</html>