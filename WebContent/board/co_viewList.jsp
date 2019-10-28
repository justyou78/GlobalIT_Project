<%@page import="globalit_pro.example.dto.CommentVO"%>
<%@page import="globalit_pro.example.dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 보기</title>
</head>
<%@include file="/session/check_session.jsp"  %> 
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int co_num = Integer.parseInt(request.getParameter("co_num"));
	//댓글 불러오기
	CommentDAO coDAO = new CommentDAO();	
	CommentVO coVO = coDAO.coView(co_num);
	if(coVO == null){
		
	}
	else{
%>
<script type="text/javascript">
	/* 댓글 삭제하기  */
	/* function deleteKey(){
		if(confirm("댓글을 삭제하시겠습니까?") == true){
			document.commentView.submit();	
		} else{
			return;
		}	
	} */
</script>
<body>
	<form name="commentView">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><%=coVO.getCo_id() %></td>
		</tr>
		<tr>
			<td>댓글 </td>
			<td><%=coVO.getCo_content()%></td>
		</tr>
		<tr>
			<td><input type="button" value="삭제" onclick="deleteKey();"/></td>
		</tr>
	</table>
<% }	%>
	</form>
</body>
</html>