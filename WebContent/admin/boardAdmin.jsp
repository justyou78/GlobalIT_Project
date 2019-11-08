<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<%
	String page2 = request.getParameter("page2") == null ? "" : request.getParameter("page2");
%>
<body>
	<h1>게시판관리페이지</h1>
	*<a href="mainAdmin.jsp?page=boardAdmin&page2=boardList">문의사항</a>
	*<a href="mainAdmin.jsp?page=boardAdmin&page2=noticeList">공지사항</a>
	<center>
	<%
		if(page2.equals("boardList")){
			%><jsp:include page="../board/boardList.jsp" /><%
		}else if(page2.equals("noticeList")){
			%><jsp:include page="../board/noticeList.jsp" /><%
		}else{
			%><h2>페이지를 선택하세요</h2><%
		}
	%>
	</center>
</body>
</html>