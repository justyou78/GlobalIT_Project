<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<%@include file="/session/admin_session.jsp"  %> 
<%
	String id= (String) session.getAttribute("id");
%>
</head>
<%-- 관리자일 경우 ismanager = true / 유저는 false --%>

<body>
	<div class="container" style="margin-top:30px;">
	<form action="../board/noticeWritePro.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-hover table-bordered" >
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="title"/></td>
			</tr>	
			<tr>
				<th scope="row">작성자</th><!-- 관리자만 가능 -->
				<td><span><%=id %></span><input type="hidden" name="id" value="<%=id%>"/></td>
			</tr>
			<tr><td></td>
				<td><input type="checkbox" name="notice" value="1" checked="checked"/>공지사항</td>
			</tr>	
			<tr>
				<th scope="row">내용</th>
				<td><textarea id="exampleFormControlTextarea1" cols="50" rows="10" name="content"></textarea></td>
			</tr>	
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th scope="row">첨부파일</th>
				<td><input type="file" name="save"  /></td>
			</tr>
		</table>
		<div style="height:50px">
		<div class="float-right">
		<input type="button" value="목록보기" class="btn btn-primary" onclick="window.location.href='header.jsp?pgName=notice'"/>
		<input type="submit" value="확인" class="btn btn-primary"/>
		</div>
		</div>
	</form>
</div>
</body>
</html>