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
	String id = (String) session.getAttribute("id");
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.view(num);
	
%>
<script>
	
	function noticeDel(){
		<%
		if(id.equals("admin")){
		%>
			if(confirm("삭제하시겠습니까?")){	//확인
				document.location.href="../board/noticeDeletePro.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum%>";	
			} else{		//취소
				
			}
		<%
		} else{
		%>
			alert("삭제 권한이 없습니다.");
	<%	}%>
	}	
	function noticeModi(){
		<%
		if(id.equals("admin")){
		%>
			if(confirm("수정하시겠습니까?")){	//확인
				document.location.href="header.jsp?pgName=noticeModify&num=<%=vo.getNum()%>&pageNum=<%=pageNum%>";	
			} else{		//취소
				
			}
	<%	} else {	%>
			alert("수정 권한이 없습니다.");
	<%	}%>
	}

</script>
<body>
	<div class="container" style="margin-top:30px;">
	<h2>게시글</h2>
	<div style="border-top:1px solid black;" ><span class="h3">★<%=vo.getTitle() %></span>		<small class="float-right"><%= vo.getTime() %>(<%= vo.getNum()%>)</small></div>
	  	 <span style="border-bottom:1px solid black; margin-bottom:10px;" id="emailHelp" class="form-text text-muted">보낸사람 <%= vo.getId() %></span>
	   <textarea readonly class="form-control bg-transparent"  rows="10" cols="150" style="margin-bottom:10px;"><%= vo.getContent().trim() %></textarea>
	   
	   <div class="card mb-3" style="max-width: 540px;">
		  <div class="row no-gutters">
		    <div class="col-md-4">
		      <img src="<%=vo.getFilename() %>" class="card-img" alt="...">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title">첨부 이미지</h5>
		        <p class="card-text">게시글과 함께 포함된 이미지 입니다.</p>
		      </div>
		    </div>
		  </div>
		</div>
	   
	   
	   <div class="float-right">
	   	<input type="button" class="btn btn-warning" value="목록보기" onclick="document.location.href='header.jsp?pgName=notice&pageNum=<%=pageNum%>'"/>
		<input type="button" class="btn btn-warning" value="수정하기" onclick="noticeModi()"/>
		<%-- <input type="button" value="삭제하기" onclick="document.location.href='noticeDeletePro.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum%>'"/> --%>
		<input type="button" class="btn btn-warning" value="삭제하기" onclick="noticeDel()"/>
		</div>
	<br/><br/>
	
	<jsp:include page="co_viewList.jsp">
		<jsp:param value="<%=num %>" name="co_num"/>
	</jsp:include>
	<br/><br/>
	
	<!-- 댓글달기 -->
		<!-- 댓글 입력하기 -->
		<form action="../board/co_insertPro.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum %>" method="post">
			<h3>댓글</h3>
			<div><span>작성자:<%=id%></span> <input type="hidden" name="co_id" value="<%=id%>"/></div>
			 <textarea class="form-control bg-transparent"  rows="3" cols="150" style="margin-bottom:10px; margin-top:5px;;" name="co_content"></textarea>
			
			 <div style="height: 30px;"><span  class="float-right" ><input type="submit" value="확인" class="btn btn-warning"/><input type="reset" value="취소" class="btn btn-warning" style="border-left:5px;"></span></div>
			
			
			<input type="hidden" name="whereBoard" value="notice"/>
		</form>
	<br/><br/>	
	<!-- 댓글 보기 -->
	

		
	
	</div>
</body>
</html>