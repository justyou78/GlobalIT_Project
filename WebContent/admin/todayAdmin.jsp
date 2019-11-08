<%@page import="globalit_pro.example.dto.ReservationDTO"%>
<%@page import="globalit_pro.example.dao.ReservationDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width:850px;
	}
	.stats{
		width:180px;
	}
	.title{
		font-weight: bold;
		text-align: center;
	}
</style>
</head>
<%
	ReservationDAO dao = new ReservationDAO();
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = (cal.get(Calendar.MONTH) + 1);
	int day = cal.get(Calendar.DAY_OF_MONTH);
%>
<body>
	<h1>오늘할일</h1>

	<table>
		<tr>
			<td colspan="4" class="title">
				오늘의예약
			</td>
		</tr>
		<%if(dao.check(year, month, day, 1)){
			ReservationDTO member = dao.selectAll(year, month, day, 1);%>
		<tr>
			<td>예약자 : <%=member.getId() %></td>
			<td>방번호 : <%=member.getRoom_num() %></td>
			<td>예약날짜 : <%=member.getYear() %>-<%=member.getMonth() %>-<%=member.getDay() %></td>
			<td class="stats">예약상태 : <%if(member.getStats() == 0){%>예약불가<br /><%}else if(member.getStats() == 1){%>예약가능<br /><%}else if(member.getStats() == 2){%>예약완료<br /><%}else if(member.getStats() == 3){%>예약진행중<br /><%}else if(member.getStats() == 4){%>예약취소중<br /><%}else{%>전화문의<br /><%}%></td>
		</tr>
		<%}%>
		<%if(dao.check(year, month, day, 2)){
			ReservationDTO member = dao.selectAll(year, month, day, 2);%>
		<tr>
			<td>예약자 : <%=member.getId() %></td>
			<td>방번호 : <%=member.getRoom_num() %></td>
			<td>예약날짜 : <%=member.getYear() %>-<%=member.getMonth() %>-<%=member.getDay() %></td>
			<td class="stats">예약상태 : <%if(member.getStats() == 0){%>예약불가<br /><%}else if(member.getStats() == 1){%>예약가능<br /><%}else if(member.getStats() == 2){%>예약완료<br /><%}else if(member.getStats() == 3){%>예약진행중<br /><%}else if(member.getStats() == 4){%>예약취소중<br /><%}else{%>전화문의<br /><%}%></td>
		</tr>
		<%}%>
		<%if(dao.check(year, month, day, 3)){
			ReservationDTO member = dao.selectAll(year, month, day, 3);%>
		<tr>
			<td>예약자 : <%=member.getId() %></td>
			<td>방번호 : <%=member.getRoom_num() %></td>
			<td>예약날짜 : <%=member.getYear() %>-<%=member.getMonth() %>-<%=member.getDay() %></td>
			<td class="stats">예약상태 : <%if(member.getStats() == 0){%>예약불가<br /><%}else if(member.getStats() == 1){%>예약가능<br /><%}else if(member.getStats() == 2){%>예약완료<br /><%}else if(member.getStats() == 3){%>예약진행중<br /><%}else if(member.getStats() == 4){%>예약취소중<br /><%}else{%>전화문의<br /><%}%></td>
		</tr>
		<%}%>
	</table>
 
 <%
 	int stats = 0;
 %>
	<table>
		<tr>
			<td colspan="5" class="title">
				입금대기중인예약자
			</td>
		</tr>
			<%
				stats = 3;
				List<ReservationDTO> list1 = dao.selectStats(stats);
				if(list1 == null){
					%><tr><td>입금대기중인예약자가 없습니다.<td></tr><%
				}
				for(ReservationDTO dto : list1){%>
		<tr>
			<td>예약자 : <%=dto.getId() %></td>
			<td>방번호 : <%=dto.getRoom_num() %></td>
			<td>예약날짜 : <%=dto.getYear() %>-<%=dto.getMonth() %>-<%=dto.getDay() %></td>
			<td class="stats">예약상태 : <%if(dto.getStats() == 0){%>예약불가<br /><%}else if(dto.getStats() == 1){%>예약가능<br /><%}else if(dto.getStats() == 2){%>예약완료(입급완료)<br /><%}else if(dto.getStats() == 3){%>예약진행중<br /><%}else if(dto.getStats() == 4){%>예약취소중<br /><%}else{%>전화문의<br /><%}%>
			</td><td><input type="button" value="예약승인" onclick="location='reservAccept.jsp?room_num=<%=dto.getRoom_num() %>&year=<%=dto.getYear() %>&month=<%=dto.getMonth() %>&day=<%=dto.getDay() %>'"/></td>
		</tr>
			<%	}
			%>
			
	</table>
	<table>
		<tr>
			<td colspan="5" class="title">
				예약취소중인예약자
			</td>
		</tr>
			<%
				stats = 4;
				List<ReservationDTO> list2 = dao.selectStats(stats);
				if(list2 == null){
					%><tr><td>예약취소중인예약자가 없습니다.<td></tr><%
				}
				for(ReservationDTO dto : list2){%>
		<tr>
			<td>예약자 : <%=dto.getId() %></td>
			<td>방번호 : <%=dto.getRoom_num() %></td>
			<td>예약날짜 : <%=dto.getYear() %>-<%=dto.getMonth() %>-<%=dto.getDay() %></td>
			<td class="stats">예약상태 : <%if(dto.getStats() == 0){%>예약불가<br /><%}else if(dto.getStats() == 1){%>예약가능<br /><%}else if(dto.getStats() == 2){%>예약완료<br /><%}else if(dto.getStats() == 3){%>예약진행중<br /><%}else if(dto.getStats() == 4){%>예약취소중<br /><%}else{%>전화문의<br /><%}%>
			</td><td><input type="button" value="취소승인" onclick="location='reservCancel.jsp?room_num=<%=dto.getRoom_num() %>&year=<%=dto.getYear() %>&month=<%=dto.getMonth() %>&day=<%=dto.getDay() %>'"/>
			</td>
		</tr>
			<%	}
			%>
	</table>

</body>
</html>