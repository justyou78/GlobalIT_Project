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
<%@include file="/session/check_session.jsp"  %> 
</head>
<body>
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
	int date = request.getParameter("day") == null ? 0 : Integer.parseInt(request.getParameter("day"));
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
<table class="table table-hover" >
	<thead class="thead-dark">
	<tr>
		<th  scope="col" class="text-center" colspan="7">
		
		<h3><a href="header.jsp?pgName=bookingCal&year=<%=prevYear%>&month=<%=prevMonth%>">prev</a> 
		<%=year%>년 <%=month+1%>월 
		<a href="header.jsp?pgName=bookingCal&year=<%=nextYear%>&month=<%=nextMonth%>">next</a>		
		</h3>
		</th>
		
	</tr>
	</thead>
	<tr>
		<td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
	</tr>
	<tr>
	<%	for(int i = 1; i < bgnWeek; i++){ // 앞빈공간생성 %>	
			<td></td>
	<%	}		
		while(cal.get(Calendar.MONTH) == month) { %>
			<td>
			<%
			dateCOM = cal.compareTo(caltoday); // 오늘날짜보다 전일경우 -1
			dateCOM_2 = cal.compareTo(caltoday_2); // 60일이후 날짜보다 전일경우 -1
			if((dateCOM == 1 || dateCOM == 0) && dateCOM_2 == -1){
				%><a href="header.jsp?pgName=bookingCal&year=<%=cal.get(Calendar.YEAR)%>&month=<%=cal.get(Calendar.MONTH)+1%>&day=<%=cal.get(Calendar.DATE)%>"><%=cal.get(Calendar.DATE) %></a><%
			}else if(dateCOM == -1){
				%><%=cal.get(Calendar.DATE) %><%
			}else{
				%><%=cal.get(Calendar.DATE) %><%
			}
			%>
			</td>
		<%	if(cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){ %>
				</tr><tr>
		<%	}
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
		}
		for(int i = cal.get(Calendar.DAY_OF_WEEK); i <= 7; i++){ // 뒷빈공간생성 %>
			<td></td>
	<%	} %>
	</tr>
</table>
	<jsp:include page="../booking/bookingForm_02.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=cal.get(Calendar.MONTH)+1%>&date=<%=cal.get(Calendar.DATE)%>"></jsp:include>
</body>
</html>