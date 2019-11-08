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
	int room_num = request.getParameter("room_num") == null ? 0 : Integer.parseInt(request.getParameter("room_num"));
	int year = request.getParameter("year") == null ? 0 : Integer.parseInt(request.getParameter("year"));
	int month = request.getParameter("month") == null ? 0 : Integer.parseInt(request.getParameter("month"));
	int day = request.getParameter("day") == null ? 0 : Integer.parseInt(request.getParameter("day"));
	
	ReservationDAO dao = new ReservationDAO();
	dao.delete(room_num, year, month, day);
%>
<body>
<script type="text/javascript">
	alert("취소가승인되었습니다");
	location="mainAdmin.jsp?page=todayAdmin";
</script>
</body>
</html>