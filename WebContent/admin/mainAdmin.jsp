<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
		text-align: center;
		width: 900px;
		margin: 0 auto;
	}
	
	header, nav, section {
		border: 1px solid;
		margin: 5px;
		padding: 10px;
	}
</style>
<jsp:include page="/session/admin_session.jsp"></jsp:include>

</head>
<%
	String str = request.getParameter("page") == null ? "" : request.getParameter("page");
%>
<body>
	<header>[<a href="mainAdmin.jsp">관리자페이지</a>] [<a href="../display/header.jsp">메인페이지</a>]</header>
	<nav>
		*<a href="mainAdmin.jsp?page=revenue">매출분석</a>
		*<a href="mainAdmin.jsp?page=reservAdmin">예약관리</a>
		*<a href="mainAdmin.jsp?page=boardAdmin">게시판관리</a>
		*<a href="mainAdmin.jsp?page=memberAdmin">회원관리</a>
	</nav>
	<section>
		<%if(str.equals("revenue")){%>
			<jsp:include page="revenue.jsp" />
		<%}else if(str.equals("reservAdmin")){%>
			<jsp:include page="reservAdmin.jsp" />
		<%}else if(str.equals("boardAdmin")){%>
			<jsp:include page="boardAdmin.jsp" />
		<%}else if(str.equals("memberAdmin")){%>
			<jsp:include page="memberAdmin.jsp" />
		<%}else if(str.equals("boardAdminView")){ %>
			<jsp:include page="boardAdminView.jsp" />
		<%}else if(str.equals("memberAdminInfo")){ %>
			<jsp:include page="memberAdminInfo.jsp" />
		<%}else{ %>
			<jsp:include page="homeAdmin.jsp" />
		<%} %>
	</section>
</body>
</html>