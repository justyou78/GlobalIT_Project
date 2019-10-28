<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/session/admin_session.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width:850px;
		text-align:center;
	}
</style>
</head>
<body>
	<h1>홈페이지입니다</h1>

<table>
	<tr>
		<td>
		<a href="mainAdmin.jsp?page=revenue"><img src="img/revenue.png" /><br/>매출분석</a>
		</td>
		<td>
		<a href="mainAdmin.jsp?page=reservAdmin"><img src="img/reserv.png" /><br/>예약관리</a>		
		</td>
		<td>
		<a href="mainAdmin.jsp?page=boardAdmin"><img src="img/board.png" /><br/>게시판관리</a>		
		</td>
		<td>
		<a href="mainAdmin.jsp?page=memberAdmin"><img src="img/member.png" /><br/>회원관리</a>
		</td>
	</tr>
</table>
</body>
</html>