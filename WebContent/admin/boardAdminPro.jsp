<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String num = request.getParameter("num");
	String page_num = request.getParameter("page_num");
	
	BoardDAO dao = new BoardDAO();
	dao.delete(Integer.parseInt(num));
	
%>
<body>
<script type="text/javascript">
	alert("삭제완료");
	location="mainAdmin.jsp?page=boardAdmin"
</script>
</body>
</html>