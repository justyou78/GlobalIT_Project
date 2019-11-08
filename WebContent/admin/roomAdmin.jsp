<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>방추가하기</title>
</head>
	<%
		String roomNumber = request.getParameter("roomNumber") ==null?"":request.getParameter("roomNumber");
	%>
<body>
	<form action="mainAdmin.jsp">
	<input type="hidden" name="page" value="roomAdmin">
	<select name="roomNumber">
		<option value="1">1번방</option>
		<option value="2">2번방</option>
		<option value="3">3번방</option>
	</select>
		<input type="submit" value="전송" >
	</form>
		<%if(roomNumber.equals("1")){%>
			<h1>1번방수정페이지입니다.</h1>
			<jsp:include page="/display/room01.jsp" />
		<%}else if(roomNumber.equals("2")){%>
			<h1>2번방수정페이지입니다.</h1>
			<jsp:include page="/display/room02.jsp" />
		<%}else if(roomNumber.equals("3")){%>
			<h1>3번방수정페이지입니다.</h1>
			<jsp:include page="/display/room03.jsp" />
		<%}else{%>
			<h1>페이지를 선택하세요.</h1>
		<% }%>
</body>
</html>