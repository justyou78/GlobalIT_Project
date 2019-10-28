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
		
		<form action="passwordPro.jsp" method="post">
		기존 비밀번호 : <input type="password" name="origin_pw" /> <br/>
		새 비밀번호: <input type="password"  name="pw" /> <br/>
		새 비밀번호 확인.: <input type="password" name="pw_check" /> <br/>
		<input type="submit" value="변경"/>
		</form>
		
		  
</body>
</html>