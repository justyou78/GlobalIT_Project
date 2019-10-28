<%@page import="globalit_pro.example.dto.BoardVO"%>
<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
		width:50px;
	}
	.title{
		width:500px;
	}
	.name{
		width:120px;
	}
	.date{
		width:120px;
	}
	.delete{
		width:50px;
	}
	
</style>
</head>
<body>
	<h1>게시판관리페이지</h1>
	<%
	int pageSize = 10;	//보여지는 게시글 수 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	//날짜,시간을 내가 원하는 방식으로 출력
%>
<%
	String pageNum = request.getParameter("pageNum");	//현재 페이지 넘버
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);	//현재 페이지 int형으로 변환
	int startRow = (currentPage - 1) * pageSize + 1; 	//(1-1)*10-1 = 1 . 게시글 번호의 시작. 1,11,21,,
	int endRow = currentPage * pageSize;		 //1*10 = 10	. 게시글 번호의 끝. 10,20,30,,
	int count = 0;		//게시글이 하나씩 작성될 때 마다 +1
	int number = 0;		//글 번호
	
	List boardList = null;
	BoardDAO dao = new BoardDAO();
	count  = dao.boardCount();	//전체 게시글 수 알려줌
	if(count > 0){
		boardList = dao.boardList(startRow, endRow);
	}
	number = count -(currentPage -1)* pageSize;	//게시글 번호
//	System.out.println("넘버"+number);
%>

<%	if(count == 0){		%>
	<table>
		<tr>
			<td align = "center"> 저장된 글이 없습니다. </td>
		</tr>
	</table>
		
<% } else { %>
	<!-- 게시글 리스트 -->
		<table>
			<tr>
				<td class="num"></td>
				<td class="title">제 목</td>
				<td class="name">작성자</td>
				<td class="date">작성일</td>
				<td></td>
			</tr>
<%
		for(int i = 0; i < boardList.size(); i++){
			BoardVO vo = (BoardVO)boardList.get(i);
%>		
			<tr>
				<td class="num"><%= number-- %></td><!-- 게시글 번호 역순으로 -->
				<td class="title"><a href="mainAdmin.jsp?page=boardAdminView&num=<%=vo.getNum() %>&pageNum=<%=currentPage %>"> <%= vo.getTitle() %></a></td>
				<td class="name"><%= vo.getId() %></td>
				<td class="date"><%= vo.getTime() %></td>
				<td class="delete"><button onclick="location='boardAdminPro.jsp?num=<%=vo.getNum()%>'">삭제</button></td>
			</tr>
	<%	}	//for %>
		</table>
<% }	// if else %>	

<!-- 하단 페이지 번호 -->
<div align="center">
<%
	if(count > 0){		//게시글 수가 0보다 크면
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;	//페이지 10개씩 한 묶음 (1-10 / 11-20 / 21-30)
		int endPage = startPage + pageBlock-1;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		if(startPage > 10){		%>
			<a href="mainAdmin.jsp?page=boardAdmin&pageNum=<%=startPage - 10 %>">[이전]</a>
<%		}
		for(int i = startPage; i <= endPage; i++){	%>
			<a href="mainAdmin.jsp?page=boardAdmin&pageNum=<%=i %>">[<%= i %>]</a>
<%		}
		if(endPage < pageCount){	%>	
			<a href="mainAdmin.jsp?page=boardAdmin&pageNum=<%=startPage + 10 %>">[다음]</a>	
<%		}
	}
%>
</div>
</body>
</html>