<%@page import="globalit_pro.example.dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = request.getParameter("id");
	ReservationDAO dao = new ReservationDAO();
	if(dao.check(id)){
		dao.setStats(id);	// 예약취소시 stats 데이터값을 4로 바꿈
	}
%>
<body>
<script>
	alert("예약취소가 완료되었습니다.");
	location="../display/header.jsp";<%-- 메인경로 지정바람 --%>
</script>
</body>
</html>