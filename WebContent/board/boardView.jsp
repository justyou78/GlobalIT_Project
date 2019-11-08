
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
	String id =(String) session.getAttribute("id");
	
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
	<div class="container" style="margin-top:30px;">
		<h2>게시글</h2>
		<div style="border-top:1px solid black;" >
			<span class="h3">★<%=vo.getTitle() %></span>
			<small class="float-right"><%= vo.getTime() %>(<%= vo.getNum()%>)</small>
		</div>
		 <span style="border-bottom:1px solid black; margin-bottom:10px;" id="emailHelp" class="form-text text-muted">보낸사람 <%= vo.getId() %></span>
		  <textarea readonly class="form-control bg-transparent"  rows="10" cols="150" style="margin-bottom:10px;"><%= vo.getContent().trim() %></textarea>
		  <%System.out.println(vo.getFilename()+"이게뭐지?"); %>
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
		   	<input type="button" class="btn btn-warning" value="목록보기" onclick="document.location.href='header.jsp?pgName=board&pageNum=<%=pageNum%>'"/>
			<input type="button" class="btn btn-warning" value="수정하기"  onclick="modiChk()"/>
			<%-- <input type="button" value="삭제하기" onclick="document.location.href='noticeDeletePro.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum%>'"/> --%>
			<input type="button" class="btn btn-warning" value="삭제하기" onclick="delChk()" />
		</div>
	
	<br/><br/>
	<jsp:include page="co_viewList.jsp">
		<jsp:param value="<%=num %>" name="co_num"/>
	</jsp:include>
	<br/><br/>
	<!-- 댓글달기 -->
	<div id="comment">
		<!-- 댓글 입력하기 -->
		<form action="../board/co_insertPro.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum %>" method="post">
			<h3>댓글</h3>
			<div><span>작성자:<%=id%></span> <input type="hidden" name="co_id" value="<%=id%>"/></div>
			 <textarea class="form-control bg-transparent"  rows="3" cols="150" style="margin-bottom:10px; margin-top:5px;;" name="co_content"></textarea>
			 <div style="margin-bottom:10px; height: 30px;"><span  class="float-right" ><input type="submit" value="확인" class="btn btn-warning"/><input type="reset" value="취소" class="btn btn-warning" style="border-left:5px;"></span></div>
			
			<input type="hidden" name="whereBoard" value="board"/>
		</form>
	</div>
	</div>
	

		
		
</body>

<script type="text/javascript">
	//작성자가 아니면 수정 안됨
	function modiChk(){
	<%
		//수정하기
		if(id.equals(vo.getId())){	%>
			document.location.href='header.jsp?pgName=boardModify&num=<%=vo.getNum()%>&pageNum=<%=pageNum%>'
	<%	} else{	%>
		alert("수정하실 수 없습니다.");
	<%	}	%>
	}
	//작성자가 아니면 삭제 안됨
	function delChk(){
		//삭제하기
	<%	if(id.equals(vo.getId())){%>
			document.location.href="header.jsp?pgName=boardDelete&num=<%=vo.getNum()%>&pageNum=<%=pageNum%>";
	<%	} else if(id.equals("admin")){	%>
			document.location.href="../board/boardDeletePro.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum%>";
	<%	} else{	%>
		alert("삭제하실 수 없습니다.");
	<%	}	%>
		
	}
</script>
</html>