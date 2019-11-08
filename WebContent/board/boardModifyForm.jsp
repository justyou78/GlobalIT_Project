<%@page import="globalit_pro.example.dto.BoardVO"%>
<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<%@include file="/session/check_session.jsp"  %> 
</head>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.modifyGetBoard(num);
	System.out.println("???"+pageNum);
%>

<body>
	<div class="container" style="margin-top:30px;">
	<form action="../board/boardModifyPro.jsp?pageNum=<%=pageNum %>" method="post" enctype="multipart/form-data">
		<table class="table table-hover table-bordered" >
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="title" value="<%=vo.getTitle()%>"/></td>
			</tr>
			<tr><!-- 아이디 입력받아서 할 예정 -->
				<th scope="row">작성자</th>
				<td><%=vo.getId() %></td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td><textarea cols="40" rows="10" name="content"><%= vo.getContent() %></textarea></td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password" name="pw" value="<%=vo.getPw()%>"/></td>
			</tr>
			<tr>
				<th scope="row">첨부 파일</th>
				<td><input type="text" name="filename" value="<%=vo.getFilename() %>"/> 
					<input type="file" name="save"></td>
			</tr>
		</table>
		<div style="height:50px">
		<div class="float-right">
		
		<input type="hidden" name="num" value="<%=num%>"/>
		<input type="submit" value="수정하기" class="btn btn-warning"/>
		<input type="button" value="목록보기" class="btn btn-warning" onclick="document.location.href='header.jsp?pgName=board&pageNum=<%=pageNum %>'"/> 
		</div>
		</div>
		
	</form>
	</div>
</body>
</html>