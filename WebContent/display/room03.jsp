<%@page import="globalit_pro.example.dto.FacilityVO"%>
<%@page import="java.util.List"%>
<%@page import="globalit_pro.example.dao.FacilityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>카시오페아</title>
<style>

</style>

<%
	FacilityDAO dao4 = new FacilityDAO();
	List<FacilityVO> list4 = null;
	String name = null;
	
	
	
%>
<body>	
<%
	name = "카시오페아"; 
	FacilityVO vo =  dao4.select_room(name);
	%>
		<img src="../admin/facility/picture/<%= vo.getFilename()%>">
		<h3><%= vo.getTitle()%></h3>
		<p><%= vo.getSubtitle()%></p>
		<p><%= vo.getRoom_type() %></p>
		<p><%= vo.getFacility_list()%></p> 
</body>