<%@page import="globalit_pro.example.dto.ReservationDTO"%>
<%@page import="globalit_pro.example.dao.ReservationDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/session/admin_session.jsp"></jsp:include>
<style type="text/css">
	.cal{
		width:120px;
		height:90px;
		font-size:14px;
	}
	.header{
		font-size:25px;
	}
	.nav{
		height:25px;
		font-size:20px;
	}
	.check{
		width:280px;
		height:25px;
	}
	
</style>

</head>
<body>
	<h1>예약관리페이지</h1>
	<%
	ReservationDAO dao = new ReservationDAO();
	ReservationDTO dto = null;
	int x = 1; // x값이 0일경우 예약불가 // 1일경우 예약가능 // 2일경우 예약완료 // 3일경우 예약진행중
	int dateCOM = 0; // 오늘날짜와 달력날짜 비교 // -1 일경우 예약종료
	int dateCOM_2 = 0; // 2달뒤날짜와 달력날짜 비교 // -1 일경우 예약불가
%>
<%
	Calendar cal = Calendar.getInstance();
	Calendar caltoday = Calendar.getInstance(); // 오늘날짜
	Calendar caltoday_2 = Calendar.getInstance(); // 60일뒤 날짜
	caltoday_2.set(caltoday.get(Calendar.YEAR), caltoday.get(Calendar.MONTH), caltoday.get(Calendar.DAY_OF_MONTH)+60); // 60일뒤 날짜세팅
	int year = request.getParameter("year") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("year"));
	int month = request.getParameter("month") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("month")) - 1);
	String date = request.getParameter("date") == null ? null : request.getParameter("date");
	cal.set(year, month, 1);
	int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);	// 빈공간생성할때 필요한 변수(요일을 숫자로 바꿈)
	
	int prevYear = year;
	int prevMonth = (month + 1) - 1;
	int nextYear = year;
	int nextMonth = (month + 1) + 1;
	
	if (prevMonth < 1) {
		prevYear--;
		prevMonth = 12;
	}
	if (nextMonth > 12) {
		nextYear++;
		nextMonth = 1;
	}
%>
<table>
	<tr>
		<td align="center" colspan="7" class="header">
		<a href="mainAdmin.jsp?page=reservAdmin&year=<%=prevYear%>&month=<%=prevMonth%>">prev</a> 
		<%=year%>년 <%=month+1%>월 
		<a href="mainAdmin.jsp?page=reservAdmin&year=<%=nextYear%>&month=<%=nextMonth%>">next</a>		
		</td>
	</tr>
	<tr>
		<td class="nav">일</td><td class="nav">월</td><td class="nav">화</td><td class="nav">수</td><td class="nav">목</td><td class="nav">금</td><td class="nav">토</td>
	</tr>
	<tr>
	<%	for(int i = 1; i < bgnWeek; i++){ // 앞빈공간생성 %>	
			<td class="cal"></td>
	<%	}		
		while(cal.get(Calendar.MONTH) == month) { %>
			<td class="cal">
			<a href="mainAdmin.jsp?page=reservAdmin&year=<%=year %>&month=<%=month+1%>&date=<%=cal.get(Calendar.DATE) %>"><%=cal.get(Calendar.DATE) %>일</a><br />
			<%
			dateCOM = cal.compareTo(caltoday); // 오늘날짜보다 전일경우 -1
			dateCOM_2 = cal.compareTo(caltoday_2); // 60일이후 날짜보다 전일경우 -1
			if((dateCOM == 1 || dateCOM == 0) && dateCOM_2 == -1){
				for(int i = 1; i <= 3; i++){
					dto = new ReservationDTO();
					dto.setYear(cal.get(Calendar.YEAR));
					dto.setMonth(month+1);
					dto.setDay(cal.get(Calendar.DATE));
					dto.setRoom_num(i);
					%><%=i %>번방 : <%
					x = dao.checkStats(dto);
					if(x == 0){%>예약불가<br /><%}else if(x == 1){%>예약가능<br /><%}else if(x == 2){%>예약완료<br /><%}else if(x == 3){%>예약진행중<br /><%}else if(x == 4){%>예약취소중<br /><%}else{%>전화문의<br /><%}
				}
			}else if(dateCOM == -1){%>예약종료<br /><%}else{%>예약불가<br /><%}
			%>
			</td>
		<%	if(cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){ %>
				</tr><tr>
		<%	}
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
		}
		for(int i = cal.get(Calendar.DAY_OF_WEEK); i <= 7; i++){ // 뒷빈공간생성 %>
			<%if(cal.get(Calendar.DAY_OF_WEEK) == 1){break;}else{%><td class="cal"></td><%}%>
	<%	} %>
	</tr>
</table>
<table>
	<tr>
		<td class="check">1</td><td class="check">2</td><td class="check">3</td>
	</tr>
	<tr>
<%	if(date != null){
		for(int i = 1; i <= 3; i++){
			ReservationDTO member = dao.selectAll(year, month+1, Integer.parseInt(date), i); 
			boolean result = dao.check(year, month+1, Integer.parseInt(date), i);%>
		<%	if(result){ %>
				<td class="check">
				예약날짜 : <%=member.getYear() %> - <%=member.getMonth() %> - <%=member.getDay() %><br/>
				예약자 : <%=member.getId() %><br/>
				예약상태 : <%if(member.getStats() == 0){%>예약불가<br /><%}else if(x == 1){%>예약가능<br /><%}else if(x == 2){%>예약완료<br /><%}else if(x == 3){%>예약진행중<br /><%}else if(x == 4){%>예약취소중<br /><%}else{%>전화문의<br /><%}%>
				<form action="reservAdminPro.jsp" method="post">
					<input type="hidden" name="year" value="<%=member.getYear() %>" />
					<input type="hidden" name="month" value="<%=member.getMonth() %>" />
					<input type="hidden" name="day" value="<%=member.getDay() %>" />
					<input type="hidden" name="id" value="<%=member.getId() %>" />
					<input type="hidden" name="room_num" value="<%=member.getRoom_num() %>" />
					
					<select name="stats">
						<option value="0">예약불가</option>
						<option value="1">예약가능</option>
						<option value="2">예약완료</option>
						<option value="3">예약진행중</option>						
						<option value="4">전화취소중</option>						
						<option value="5">전화문의</option>						
					</select>
					<input type="submit" value="전송">
				</form>
				</td>
		<%	}else{	%>
				<td class="check">예약이 없습니다</td>
		<%	} %>
	<%	} %>
<%	}%>
	</tr>				
</table>
</body>
</html>