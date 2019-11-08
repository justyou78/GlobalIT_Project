<%@page import="globalit_pro.example.dao.FacilityDAO"%>
<%@page import="globalit_pro.example.dto.FacilityVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
   		
   </style>
<title>부대시설</title>
<%
	FacilityDAO dao = new FacilityDAO();
	List<FacilityVO> list = null;
	String name = null;
%>
<body>	
<%
	name = "부대시설";
	list = dao.select_other(name);
	for(FacilityVO vo : list){%>
		<h3><%= vo.getTitle()%></h3>
		<p><%= vo.getSubtitle()%></p> 
		<img src="../admin/facility/picture/<%= vo.getFilename()%>">
<%}
%>
</body>
	
	