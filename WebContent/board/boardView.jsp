
<%@page import="globalit_pro.example.dto.BoardVO"%>
<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
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
		System.out.println("보드뷰jsp 파일>>>"+vo.getFilename());
%>
<body>
	<table>
		<tr>
			<td>글번호</td>
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
			<td>내용</td>
			<td><%= vo.getContent() %></td>
		</tr>
		<tr><!-- 비밀번호 -->
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>첨부 파일</td>
			<td><img src=<%=vo.getFilename() %> width="200px" height="auto" onerror="this.style.display='none'" /></td>
		</tr>
	</table>
	<br/><br/>
	<!-- 댓글달기 -->
	<div id="comment">
		<!-- 댓글 입력하기 -->
		<form action="../board/co_insertPro.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum %>" method="post">
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="co_id"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="co_pw"/></td>
				</tr>
				<tr>
					<td>댓글 </td>
					<td><input type="text" name="co_content"/></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인"/></td>
					<td><input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
	<br/><br/>	
	<!-- 댓글 보기 -->
	
	<jsp:include page="co_viewList.jsp">
		<jsp:param value="<%=num %>" name="co_num"/>
	</jsp:include>

	<br/><br/>
		
		
		<input type="button" value="목록보기" onclick="document.location.href='header.jsp?pgName=board&pageNum=<%=pageNum%>'"/>
		<input type="button" value="수정하기" onclick="document.location.href='header.jsp?pgName=boardModify&num=<%=vo.getNum()%>&pageNum=<%=pageNum%>'"/>
		<input type="button" value="삭제하기" onclick="document.location.href='header.jsp?pgName=boardDelete&num=<%=vo.getNum()%>&pageNum=<%=pageNum%>'"/>
</body>
</html>