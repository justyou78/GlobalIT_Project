<%@page import="globalit_pro.example.dto.CommentVO"%>
<%@page import="globalit_pro.example.dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 입력 pro</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	CommentDAO coDAO = new CommentDAO();
	CommentVO coVO = new CommentVO();
%>
<%
	String co_pw = request.getParameter("co_pw");	// 댓글 비밀번호
	String co_id = request.getParameter("co_id");
	String co_content = request.getParameter("co_content");
	
	int num = Integer.parseInt(request.getParameter("num"));	//게시글 번호
	String pageNum = request.getParameter("pageNum");
	
	coVO.setCo_pw(co_pw);
	coVO.setCo_id(co_id);
	coVO.setCo_content(co_content);
	coVO.setNum(num);
	
	coDAO.commentInsert(coVO);

	//여기에 view 페이지 링크 쓰는 법..
	//response.sendRedirect("boardView.jsp");
	
	
%>
	<script>location="../display/header.jsp?pgName=board"</script>

<body>

</body>
</html>