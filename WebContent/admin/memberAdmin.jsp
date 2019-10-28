<%@page import="globalit_pro.example.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="globalit_pro.example.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/session/admin_session.jsp"></jsp:include>
<style type="text/css">
	.member{
		width:850px;
	}
	
</style>
</head>
<%
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> list = dao.selectAll();
%>
<body>
	<h1>회원관리페이지</h1>
<table class="member">
	<tr><td>가입일</td><td>아이디</td></tr>
<%
	for(MemberDTO dto : list){ %>
	<tr>
		<td><%=dto.getTime() %></td>
		<td><a href="mainAdmin.jsp?page=memberAdminInfo&id=<%=dto.getId() %>"><%=dto.getId() %></a></td>
		<td><button onclick="location='memberAdminPro.jsp?id=<%=dto.getId()%>'">삭제</button></td>
	</tr>
<%	}
%>
</table>
</body>
</html>