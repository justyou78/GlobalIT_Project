<%@page import="globalit_pro.example.dto.FacilityVO"%>
<%@page import="java.util.List"%>
<%@page import="globalit_pro.example.dao.FacilityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>관광지</title>
<style>

</style>

<%
	FacilityDAO dao1 = new FacilityDAO();
	List<FacilityVO> list1 = null;
	String name = null;
%>
<body>	
<%
	name = "관광지"; 
	list1 =  dao1.select_other(name);
	System.out.println(list1);
	for(FacilityVO vo : list1){%>
		<h3><%= vo.getTitle()%></h3>
		<p><%= vo.getSubtitle()%></p> 
		<img src="../admin/facility/picture/<%= vo.getFilename()%>">
<%}
%>
</body>