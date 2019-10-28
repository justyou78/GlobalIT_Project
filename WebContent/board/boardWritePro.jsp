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
<title>문의글 PRO</title>
</head>
<% 
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
%>	
<% 
	String path = request.getRealPath("save");	//서버상에 저장.
	System.out.println(path);
	//String path = "E://save//";
	int max = 1024*1024*10;	//10MB
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	
	MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);
	/* vo 만들고 mr.get 가져와서 넣고  */
	
	String pw = mr.getParameter("pw");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String id = mr.getParameter("id");
	String filename = mr.getParameter("filename");
	
	System.out.println("아이디" + id);
	System.out.println("파일 네임" + filename);
	
	vo.setPw(pw);
	vo.setTitle(title);
	vo.setContent(content);
	vo.setId(id);

	
	String org = mr.getOriginalFileName("save");
	String sys = mr.getFilesystemName("save");
	String type = mr.getContentType("save");
	
	vo.setFilename(sys);
	File f = mr.getFile("save");	//path와  sys가 합친 것. 이미지 경로와 sys값까지 나옴

	dao.insert(vo);
	//String t[] =  type.split("/");
	/* long s = f.length();
	if(s > max){
		f.delete();
	} */
	
	//System.out.println("file f : " + f);
%>

<body>
	글쓰기 완료 <br/>
	filename = <%= filename %>
	org = <%=org %><br/>
	sys = <%= sys %><br/>
	type = <%= type %><br/>
	path = <%= path %><br/>
	f = <%=f %>
	<img src="/holiday/save/<%=sys%>"/>
	<input type="button" value="목록보기" onclick="location.href='../display/header.jsp?pgName=board'"/>
</body>
</html>