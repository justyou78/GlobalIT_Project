<%@page import="globalit_pro.example.dto.FacilityVO"%>
<%@page import="java.util.List"%>
<%@page import="globalit_pro.example.dao.FacilityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>오리온</title>
<style>

</style>

<%
	FacilityDAO dao3 = new FacilityDAO();
	List<FacilityVO> list3 = null;
	String name = null;
	
	
	
%>
<body>	
<%
	name = "오리온"; 
	FacilityVO vo =  dao3.select_room(name);
	%>
		<img src="../admin/facility/picture/<%= vo.getFilename()%>">
		<h3><%= vo.getTitle()%></h3>
		<p><%= vo.getSubtitle()%></p>
		<p><%= vo.getRoom_type() %></p>
		<p><%= vo.getFacility_list()%></p> 
</body>