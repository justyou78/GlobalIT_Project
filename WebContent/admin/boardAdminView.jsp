<%@page import="globalit_pro.example.dto.BoardVO"%>
<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/session/admin_session.jsp"></jsp:include>
<style type="text/css">
	table{
		width:850px;
	}
	.num{
		width:150px;
	}
	.content{
		height:300px;
	}
	.name{
		width:150px;
	}
	.date{
		width:150px;
	}
	
</style>
</head>
<body>
<%
	//게시글 번호
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
//	String co_viewList = request.getParameter("co_viewList");
//	System.out.println("댓글"+co_viewList);
	
//	System.out.println("보드뷰 게시글넘 "+ num);
//	System.out.println("보드뷰 페이지넘 "+ pageNum);
	
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//게시글 불러오기
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.view(num);
		
%>
<body>
	<table>
		<tr>
			<td class="num">글번호</td>
			<td><%= vo.getNum()%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%= vo.getTime() %></td>
		</tr>
		<tr>
		<tr>
			<td>제목</td>
			<td><%=vo.getTitle() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%= vo.getId() %></td>
		</tr>
		<tr>
			<td class="content">내용</td>
			<td><%= vo.getContent() %></td>
		</tr>
		<tr><!-- 비밀번호 -->
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>첨부 파일</td>
			<td><%= vo.getFilename() %></td>
		</tr>
	</table>
</body>
</body>
</html>