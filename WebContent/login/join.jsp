<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
</script>

</head>

<body>
	<div class="container">
		<h1 class="text-center" style="margin-top: 30px;">회원가입</h1>
		<!-- 회원가입 폼 -->
		<form action="joinPro.jsp" method="post" name="userinput">
			<!-- joinPro 페이지에서 회원가입 처리  -->
			<table class="table table-bordered  text-center"
				style="margin-top: 60px;">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" /></td>
					<!-- 아이디  -->
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
					<!-- 비밀번호  -->

				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwCheck" /></td>
					<!-- 비밀번혹확인  -->

				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="callnumber" /></td>
					<!-- 전화번호  -->
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" /></td>
					<!-- 이름 -->
				</tr>
			</table>
			<div class="float-right">
				<input type="submit" value="회원가입" class="btn btn-primary" />
			</div>
		</form>
	</div>
</body>
</html>