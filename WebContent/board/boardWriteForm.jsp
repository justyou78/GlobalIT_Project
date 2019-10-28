<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/session/check_session.jsp"  %> 
<title>문의글 쓰기</title>
</head>
<body>
	<div class="container">
	<form action="../board/boardWritePro.jsp" method="post" enctype="multipart/form-data" class="form-group">
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr><!-- 아이디 입력받아서 할 예정 -->
				<td>작성자</td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="40" rows="10" name="content"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td>첨부 파일</td>
				<td><input type="file" name="save" name="filename"/></td>
			</tr>
		</table>
		<input type="submit" value="확인"/>
		<a href="header.jsp?pgName=board"><input type="button" value="목록보기" onclick="window.location.href='boardList.jsp'"/> </a>
	</form>
	</div>

</body>
</html>