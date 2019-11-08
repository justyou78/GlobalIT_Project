<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="globalit_pro.example.dto.ReservationDTO"%>
<%@page import="globalit_pro.example.dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width:850px;
		
	}
</style>
</head>
<%
	Calendar cal = Calendar.getInstance();
	int year = request.getParameter("year") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("year"));
	int month = request.getParameter("month") == null ? cal.get(Calendar.MONTH)+1 : Integer.parseInt(request.getParameter("month"));
	ReservationDAO dao = new ReservationDAO();
	List<ReservationDTO> list = dao.selectAll();
	int sum = 0;
%>

<body>
	<h1>매출분석페이지</h1>
	<form action="mainAdmin.jsp">
		<input type="hidden" name="page" value="revenue" />
		<select name="year">
			<option value="2019">2019</option>
			<option value="2020">2020</option>
		</select>년
		<select name="month">
			<%for(int i = 1; i <= 12; i++){ %>
			<option value="<%=i %>"><%=i %></option>
			<%} %>
		</select>월
		<input type="submit" value="조회" />
	</form>
<table>
      <tr>
         <td colspan="4"><%=month %>월 매출관리표</td>
      </tr>
      <tr>
         <td>아이디</td>
         <td>예약날짜</td>
         <td>방번호</td>
         <td>금액</td>
      </tr>

<%
   for(ReservationDTO dto : list){%>
      <%if(year == dto.getYear() && month == dto.getMonth()){%>
      <tr>
         <td><%=dto.getId() %></td>
         <td><%=dto.getYear() %>-<%=dto.getMonth() %>-<%=dto.getDay() %></td>
         <td><%=dto.getRoom_num() %>번방</td>
         <td><%=dto.getMoney() %>원</td>
      </tr>
         <%sum += dto.getMoney(); %>
      <%} %>
<%   }
%>
<tr>
<td></td>
<td></td>
<td>합계</td>
<td><%=sum %>원</td>
</tr>

</table>
   
	
</body>
</html>