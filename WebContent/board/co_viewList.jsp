<%@page import="java.util.List"%>
<%@page import="globalit_pro.example.dto.CommentVO"%>
<%@page import="globalit_pro.example.dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 보기</title>
<%@include file="/session/check_session.jsp"  %> 
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int co_num = Integer.parseInt(request.getParameter("co_num"));
	
	//댓글 불러오기
	CommentDAO coDAO = new CommentDAO();	
	
	//게시글 번호와 페이지
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	System.out.println("co뷰리스트 페이지넘 : "+pageNum);
	
	List<CommentVO> list = coDAO.coList(num);
	System.out.println("coViewList:: LIST >>" + list.size());
	//CommentVO coVO = coDAO.coView(co_num);
	if(list.size() == 0){
		
	}
	else{
%>
<body>
	<form name="commentView" >
		<% for(CommentVO coVO : list){ %>
		<div style="margin-bottom:10px;margin-top:10px"><strong><span>작성자 : <%=coVO.getCo_id() %></span></strong></div>
		<div style="margin-bottom:10px;" ><span ><%=coVO.getCo_content()%></span></div>
		<input  type="hidden" name="pageNum" value="<%=pageNum %>"/>
		<div style="border-bottom:1px dotted black"><input type="button" value="삭제" class="btn btn-light btn-sm" style="margin-bottom:10px;" onclick="deleteKey(<%=coVO.getCo_num()%>,'<%=coVO.getCo_id()%>');"/></div>
	</form>

	
	

<script type="text/javascript">
	/* 댓글 삭제하기  */
	<% String id = (String) session.getAttribute("id");%>
	function deleteKey(coNum, coId){
		console.log(coNum);
		console.log(coId);
		
		if(coId == '<%=id%>' || '<%=id%>' == "admin"){
			if(confirm("댓글을 삭제하시겠습니까?")){
				document.location.href="../board/co_deletePro.jsp?co_num="+coNum+"&num=<%=coVO.getNum()%>&pageNum=<%=pageNum%>";
			}
		}
		else{
			alert("삭제하실 수 없습니다.");
			return;
		}
	}//deleteKey	
</script>

	<% 		}	%>
<% }	%>
			
			

	
</body>
</html>