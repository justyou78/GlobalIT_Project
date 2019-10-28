<%@page import="globalit_pro.example.dto.BoardVO"%>
<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
</head>
<%@include file="/session/check_session.jsp"  %> 
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.view(num);
	
%>
<script>

	function noticeDel(){
		if(confirm("삭제하시겠습니까?")){	//확인
			document.location.href="../board/noticeDeletePro.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum%>";	
		} else{		//취소
			
		}
		
	}

</script>
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
			<td><img src=<%=vo.getFilename() %> width="200px" height="auto" onerror="this.style.display='none'"/></td>
		</tr>
		<tr>
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
		
		<input type="button" value="목록보기" onclick="document.location.href='header.jsp?pgName=notice&pageNum=<%=pageNum%>'"/>
		<input type="button" value="수정하기" onclick="document.location.href='noticeModifyForm.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum%>'"/>
		<%-- <input type="button" value="삭제하기" onclick="document.location.href='noticeDeletePro.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum%>'"/> --%>
		<input type="button" value="삭제하기" onclick="noticeDel()"/>
</body>
</html>