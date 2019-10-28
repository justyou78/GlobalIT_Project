<%@page import="globalit_pro.example.dto.MemberDTO"%>
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
	String id = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getUser(id);
%>
<body>
<table class="member">
	<tr>
		<td>아이디</td>
		<td><%=dto.getId() %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=dto.getCallnumber() %></td>
	</tr>
	<tr>
		<td>가입일</td>
		<td><%=dto.getTime() %></td>
	</tr>
</table>
</body>
</html>