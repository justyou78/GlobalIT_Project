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
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	int room_num = Integer.parseInt(request.getParameter("room_num"));
	String id = request.getParameter("id");
	int stats = Integer.parseInt(request.getParameter("stats"));
	
	ReservationDAO dao = new ReservationDAO();
	if(dao.check(year, month, day, room_num)){
		dao.setStats(year, month, day, room_num, stats);
	}
	if(stats == 1){
		dao.delete(stats, year, month, day, id);
	}
%>
<body>
<script type="text/javascript">
	alert("변경완료");
	location="mainAdmin.jsp?page=reservAdmin";
</script>
</body>
</html>