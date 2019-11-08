<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/session/check_session.jsp"  %> 
<title>문의글 쓰기</title>
<%
	String id = (String) session.getAttribute("id");
%>
</head>
<body>
	<div class="container" style="margin-top:30px;">
	<form action="../board/boardWritePro.jsp" method="post" enctype="multipart/form-data" class="form-group">
		<table class="table table-hover table-bordered" >
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr><!-- 아이디 입력받아서 할 예정 -->
				<th scope="row">작성자</th>
				<td><span><%=id %></span><input type="hidden" name="id" value="<%=id%>"/></td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td><textarea cols="40" rows="10" name="content"></textarea></td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th scope="row">첨부 파일</th>
				<td><input type="file" name="save" name="filename"/></td>
			</tr>
		</table>
		<div style="height:50px">
		<div class="float-right">
		<a href="header.jsp?pgName=board"><input type="button" value="목록보기"  class="btn btn-primary" onclick="window.location.href='boardList.jsp'"/> </a>
		<input type="submit" value="확인" class="btn btn-primary"/>
		</div>
		</div>
	</form>
	</div>

</body>
</html>