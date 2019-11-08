<%@page import="globalit_pro.example.dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 삭제 PRO</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int co_num = Integer.parseInt(request.getParameter("co_num"));
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	System.out.println("co지우기프로"+pageNum);
	
	CommentDAO dao = new CommentDAO();
	int x = dao.coDelete(co_num);
	
	//pageContext.forward("boardView.jsp?pageNum="+pageNum);
%>
<body>
	<script type="text/javascript">
		document.location.href="../display/header.jsp?pgName=boardView&num=<%=num%>&pageNum=<%=pageNum%>";
	</script>
</body>
</html>