<%@page import="globalit_pro.example.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	MemberDAO dao = new MemberDAO();
	String id = request.getParameter("id");
	dao.deleteMember(id);
%>
<body>
<script type="text/javascript">
	alert("삭제완료");
	location="mainAdmin.jsp?page=memberAdmin";
</script>
</body>
</html>