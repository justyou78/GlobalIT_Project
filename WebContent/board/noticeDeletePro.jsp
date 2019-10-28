<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제 처리</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	BoardDAO dao = new BoardDAO();
	int x = dao.noticeDel(num);
%>
	<meta http-equiv="Refresh" content="0;url=../display/header.jsp?pgName=notice"/>
<script></script>
<body>
	<h2>삭제되었습니다.</h2>
</body>
</html>