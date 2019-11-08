<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<%@include file="/session/check_session.jsp"  %> 
<%
	int num = Integer.parseInt(request.getParameter("num"));
	//String pageNum = request.getParameter("pageNum");
%>

<body>
	<form action="../board/boardDeletePro.jsp" method="post">
		<table>
			<tr>
				<td>비밀번호 입력하기</td>
			</tr>
			<tr>
				<td><input   type="password" name="pw" placeholder="비밀번호"/>
					<input type="hidden" name="num" value="<%=num%>"/>
				</td>
			</tr>
			<tr>
				<td><input class="btn btn-warning" type="submit" value="글삭제" />
					<input  class="btn btn-warning" type="button" value="글목록"
						onclick="location.href='header.jsp?pgName=board'"/>
				</td>
			</tr>
		</table>
	
	
	</form>
</body>
</html>