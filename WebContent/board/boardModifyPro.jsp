<%@page import="globalit_pro.example.dto.BoardVO"%>
<%@page import="globalit_pro.example.dao.BoardDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 pro</title>
</head>
<%
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
		
	String path = request.getRealPath("save");
	int max = 1024*1024*10;
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	
	MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);
	
	String pageNum = request.getParameter("pageNum");//페이지 번호
	
	String pw = mr.getParameter("pw");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String id = mr.getParameter("id");
	String filename = mr.getParameter("filename");
	String num = mr.getParameter("num");
	
	System.out.println("페이지넘"+pageNum);
	
	vo.setNum(Integer.parseInt(num));
	vo.setPw(pw);
	vo.setTitle(title);
	vo.setContent(content);
	vo.setId(id);
	vo.setFilename(filename);
	
	dao.modify(vo);
	
	
//	int check = dao.modify(vo);
	
	String org = mr.getOriginalFileName("save");
	String sys = mr.getFilesystemName("save");
	String type = mr.getContentType("save");
	
	File f = mr.getFile("save");	//파일 타입 저장
	
	//if(check == 1){
%>		
		
<%	//} else{	%>
	 	<!-- <script type="text/javascript">
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>  -->
<%	//} %>

<body>
	수정되었습니다.
	<img src="/GlobalIT_Pro/save/<%=sys %>"/>
		
	<input type="button" value="쓴 글 보기" onclick="document.location.href='../display/header.jsp?pgName=boardView&num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'"/>
	<input type="button" value="목록보기" onclick="location.href='../display/header.jsp?pgName=board&pageNum=<%=pageNum%>'"/>
</body>
</html>