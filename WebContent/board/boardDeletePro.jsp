<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제 pro</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
//	String pageNum = request.getParameter("pageNum");
	String pw = request.getParameter("pw");
	
	BoardDAO dao = new BoardDAO();
	int check = dao.delete(num, pw);
	if(check == 1){
%>
	<meta http-equiv="Refresh" content="0;url=../display/header.jsp?pgName=board">	
		
<%	} else {%>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<% 	}	%>
<body>
	<h2> 게시글이 삭제 되었습니다.</h2>
</body>
</html>