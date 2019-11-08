<%@page import="globalit_pro.example.dto.ReservationDTO"%>
<%@page import="globalit_pro.example.dao.ReservationDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking Pro</title>
</head>
<%
	ReservationDAO dao = new ReservationDAO();

	//이용기간 넣기
	int year = Integer.parseInt(request.getParameter("year"));	//년
	int month = Integer.parseInt(request.getParameter("month"));	//월
	int day = Integer.parseInt(request.getParameter("day"));		//일 
	String id = request.getParameter("id");

	int room_num1 = request.getParameter("room_num1") == null ? 0 : Integer.parseInt(request.getParameter("room_num1"));//방번호
	int money1 = request.getParameter("money1") == null ? 0 : Integer.parseInt(request.getParameter("money1"));//방요금
	int stayDay1 = request.getParameter("stayDay1") == null ? 0 : Integer.parseInt(request.getParameter("stayDay1"));	//이용기간
	
	int room_num2 = request.getParameter("room_num2") == null ? 0 : Integer.parseInt(request.getParameter("room_num2"));//방번호
	int money2 = request.getParameter("money2") == null ? 0 : Integer.parseInt(request.getParameter("money2"));//방요금
	int stayDay2 = request.getParameter("stayDay2") == null ? 0 : Integer.parseInt(request.getParameter("stayDay2"));	//이용기간
	
	int room_num3 = request.getParameter("room_num3") == null ? 0 : Integer.parseInt(request.getParameter("room_num3"));//방번호
	int money3 = request.getParameter("money3") == null ? 0 : Integer.parseInt(request.getParameter("money3"));//방요금
	int stayDay3 = request.getParameter("stayDay3") == null ? 0 : Integer.parseInt(request.getParameter("stayDay3"));	//이용기간
	
	
	if(room_num1 != 0){
		ReservationDTO dto = new ReservationDTO();
		dto.setYear(year);
		dto.setMonth(month);
		dto.setDay(day);
		dto.setId(id);
		dto.setRoom_num(room_num1);
		dto.setMoney(money1);
		dao.reserv(dto, stayDay1);
	}
	if(room_num2 != 0){
		ReservationDTO dto = new ReservationDTO();
		dto.setYear(year);
		dto.setMonth(month);
		dto.setDay(day);
		dto.setId(id);
		dto.setRoom_num(room_num2);
		dto.setMoney(money2);
		dao.reserv(dto, stayDay2);
	}
	if(room_num3 != 0){
		ReservationDTO dto = new ReservationDTO();
		dto.setYear(year);
		dto.setMonth(month);
		dto.setDay(day);
		dto.setId(id);
		dto.setMoney(money3);
		dto.setRoom_num(room_num3);
		dao.reserv(dto, stayDay3);
	}
%>
<body>

<%
	List<ReservationDTO> list = null;
	boolean result_2 = dao.check(id);
%>
<% 	if(result_2){%>
<script type="text/javascript">
	alert("예약완료");
	location="../display/header.jsp?pgName=bookingConfirmForm";
</script>
<%	} %>
</body>
</html>