<%@page import="globalit_pro.example.dto.ReservationDTO"%>
<%@page import="globalit_pro.example.dao.ReservationDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = (String) session.getAttribute("id");
	ReservationDAO dao = new ReservationDAO();
	List<ReservationDTO> list = null;
	if(dao.check(id)){
		list = dao.selectAll(id);
	}
%>
<body>
	<div class="container">
	<table class="table">
<%
	
	for(ReservationDTO dto : list){%>
		<tr>
		<td>
			예약날짜 : <%=dto.getYear() %> - <%=dto.getMonth() %> - <%=dto.getDay() %>
		<%
		String room_name = null;
		if(dto.getRoom_num() == 1){
			room_name = "페가수스";
		}else if(dto.getRoom_num() == 2){
			room_name = "오리온";
		}else if(dto.getRoom_num() == 3){
			room_name = "카시오페아";
		}
		%>
		</td>
		
		<td>
		방이름 : <%=room_name %>
		</td>
<%	}
%>
		
		</table>
		<form action="../booking/bookingConfirmPro.jsp" method="post" style="margin-bottom:10px;">
			<input type="hidden" name="id" value="<%=id %>" />
			<input class="btn btn-warning"   type="submit" value="예약취소" />
		</form>
	</div>
	
	
</body>
</html>