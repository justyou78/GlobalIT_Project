<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="globalit_pro.example.dto.MemberDTO"%>
<%@page import="globalit_pro.example.dao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>

<%@include file="/session/check_session.jsp"  %> 
</head>
<body>

<%
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDTO dto= new MemberDAO().getUser(sessionID);
		
%>


<form action="changeInfopro.jsp" method="POST">
<table>
		
		<tr>	
		<td>아이디</td>
			<td><input type="text" value="<%=dto.getId() %>"  name="id"  readonly  /></td>
		</tr>

		<tr>
			<td>기존비밀번호</td>
			<td><input type="text" value=""  name="origin_pw"/></td>
		</tr>
	

		<tr>
			<td>이름</td>
			<td><input type="text" value="<%=dto.getName() %>" name="name"/></td>
		</tr>

		<tr>
			<td>전화번호</td>
			<td><input type="text" value="<%=dto.getCallnumber()%>"  name="callnumber"/></td>
		</tr>

	

	
		
		
		
		
	</table>
		<input type="submit" value="수정하기"/> </td>
		<input type="button" value="회원탈퇴" onclick="window.location='deleteForm.jsp'"/>
		<input type="button" value="비밀번호 수정" onclick="window.location='password.jsp'"/>
</form>

</body>
</html>