<%@page import="globalit_pro.example.dto.BoardVO"%>
<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 리스트</title>
</head>
<%@include file="/session/check_session.jsp"  %> 
<%-- 페이치 처리 --%>
<%
	int pageSize = 10;	//보여지는 게시글 수 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	//날짜,시간을 내가 원하는 방식으로 출력
	String id = (String) session.getAttribute("id");

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
%>


<body>
<div  class="container">
	<h1 class="text-center">문의사항</h1>  <a href="header.jsp?pgName=boardWrite">
	<button style="margin-bottom: 10px;" type="button" class="btn btn-primary float-right" >글쓰기</button></a>
	 <br/>
<%	if(count == 0){		%>
	<table class="table" border="1">
		<tr>
			<td align = "center"> 저장된 글이 없습니다. </td>
		</tr>
	</table>
		
<% } else { %>
	<!-- 게시글 리스트 -->
		<table class="table table-hover"  border="1">
		<thead class="thead-dark">
		    <tr>
		      <th scope="col"></th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">작성일</th>
		      <%if(id.equals("admin")){%>
            	<th scope="col">관리자권한</th>
            <%} %>
		      
		    </tr>
  </thead>
<%
		for(int i = 0; i < boardList.size(); i++){
			BoardVO vo = (BoardVO)boardList.get(i);
%>		
	<tbody>
			<tr>
				<th scope="row"><%= number-- %></th>  <!-- 게시글 번호 역순으로 -->
				<td><a href="header.jsp?pgName=boardView&num=<%=vo.getNum() %>&pageNum=<%=currentPage %>"> <%= vo.getTitle() %></a></td>
				<td><%= vo.getId() %></td>
				<td><%= vo.getTime() %></td>
				<%if(id.equals("admin")){%>
               <td><button onclick="location='../board/boardAdminPro.jsp?num=<%= vo.getNum() %>&pgName=board'">삭제</button></td>
            <%} %>
			</tr>
	</tbody>
	<%	}	//for %>
		</table>
<% }	// if else %>	

<!-- 하단 페이지 번호 -->
<%
	if(count > 0){		//게시글 수가 0보다 크면
		//총 페이지 수
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	System.out.println("페이지 카운트"+pageCount);
		int startPage = (int)(currentPage/10)*10+1;
			if((currentPage % 10) == 0){
				startPage = currentPage-9;
			}
		int pageBlock=10;	//페이지 10개씩 한 묶음 (1-10 / 11-20 / 21-30)
		int endPage = startPage + pageBlock-1;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		%>
		<div class="text-center">
		<%
		if(startPage > 10){		%>
   		 	
			<a href="header.jsp?pgName=board&pageNum=<%=startPage - 9 %>"  class="col" >[이전]</a>
<%		}
		for(int i = startPage; i <= endPage; i++){	%>
			<a href="header.jsp?pgName=board&pageNum=<%=i %>" >[<%= i %>]</a>
<%		}
		if(endPage < pageCount){	%>	
			<a href="header.jsp?pgName=board&pageNum=<%=startPage + 10 %>" class="col"   >[다음]</a>	
<%		}
	}
%>
			</div>
		



	</div>
</body>
</html>