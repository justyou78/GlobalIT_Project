<%@page import="globalit_pro.example.dto.ReservationDTO"%>
<%@page import="globalit_pro.example.dao.ReservationDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<%
	ReservationDAO dao = new ReservationDAO();
	ReservationDTO dto = null;
	int x = 0; // 1일경우 예약 가능 // 그외 불가 
%>
<%
	Calendar cal = Calendar.getInstance();
	Calendar caltoday = Calendar.getInstance();
	Calendar caltoday_2 = Calendar.getInstance(); // 60일뒤 날짜
	caltoday_2.set(caltoday.get(Calendar.YEAR), caltoday.get(Calendar.MONTH), caltoday.get(Calendar.DAY_OF_MONTH)+60); // 60일뒤 날짜세팅

	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = request.getParameter("date") == null ? cal.get(Calendar.DAY_OF_MONTH) : Integer.parseInt(request.getParameter("date"));
	cal.set(year, month, date);
	String today = sdf.format(caltoday.getTime()); // 오늘날짜 7일단위 이동가능	
	String korDOW = null; //요일변수
	int dateCOM = 0; // 오늘날짜와 달력날짜 비교 // -1 일경우 예약종료
	int dateCOM_2 = 0; // 2달뒤날짜와 달력날짜 비교 // -1 일경우 예약불가
%>
<body>
	
	<table class="table table-hover" border="1">
	<thead class="thead-dark">
		<tr>
			<th scope="col"  class="text-center" align="center" colspan="8">
			<a href="header.jsp?pgName=booking&date=<%=date-7 %>"> prev-7 </a>	
			<%=cal.get(Calendar.YEAR) %>년 <%=cal.get(Calendar.MONTH) + 1 %>월 <%=cal.get(Calendar.DAY_OF_MONTH) %>일 
			<a href="header.jsp?pgName=booking&date=<%=date+7 %>"> next+7 </a><br />
			오늘날짜 : <%=today %>
			</th>
		</tr>
	</thead>
		<%	
			String names[] = {"날짜","1번방","2번방","3번방"};
			for(int i = 0; i <= 3; i++){%>
		<thead class="thead-dark" >
		
		<tr>
		
			<td><%=names[i] %></td>
			<%	for(int j = 0; j < 7; j++){
					cal.set(year, month, date+j);
					if(cal.get(Calendar.DAY_OF_WEEK) == 1){korDOW="일";}else if(cal.get(Calendar.DAY_OF_WEEK) == 2){korDOW="월";}else if(cal.get(Calendar.DAY_OF_WEEK) == 3){korDOW="화";}else if(cal.get(Calendar.DAY_OF_WEEK) == 4){korDOW="수";}else if(cal.get(Calendar.DAY_OF_WEEK) == 5){korDOW="목";}else if(cal.get(Calendar.DAY_OF_WEEK) == 6){korDOW="금";}else if(cal.get(Calendar.DAY_OF_WEEK) == 7){korDOW="토";}
					if(i == 0){
						%><td ><%=cal.get(Calendar.YEAR) %>-<%=cal.get(Calendar.MONTH) + 1 %>-<%=cal.get(Calendar.DAY_OF_MONTH) %>(<%=korDOW %>)</td><% // 첫번째행 날짜생성
					}else{
						dto = new ReservationDTO();
						dto.setYear(cal.get(Calendar.YEAR));
						dto.setMonth(cal.get(Calendar.MONTH) + 1);
						dto.setDay(cal.get(Calendar.DAY_OF_MONTH));
						dto.setRoom_num(i);
						x = dao.checkStats(dto);
						dateCOM = cal.compareTo(caltoday);	// 오늘날짜보다 전일경우 -1
						dateCOM_2 = cal.compareTo(caltoday_2); // 60일이후 날짜보다 전일경우 -1
						if((dateCOM == 1 || dateCOM == 0) && dateCOM_2 == -1){
							if(x == 1){%>
								<td>가능</td><%
							}else{%>
								<td>불가능</td><%
							}							
						}else if(dateCOM == -1){
							%><td>예약종료</td><%
						}else{
							%><td>예약불가</td><%
						}
					}
				} %>
		</tr>			
		</thead>	
		<%	}
		%>
	</table>
</body>
</html>

		