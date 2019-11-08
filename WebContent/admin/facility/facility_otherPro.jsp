<%@page import="java.util.Enumeration"%>
<%@page import="globalit_pro.example.dao.FacilityDAO"%>
<%@page import="globalit_pro.example.dto.FacilityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
/*  사진을 저장할 경로 */
String path = request.getRealPath("admin/facility/picture");
/* 파일 크기 */
int max = 1024*1024*10; //10MB
/* 인코딩  */
String enc = "UTF-8";
/* 파일 네임정책 객체 생성 */
DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
/*  MultipartRequest 객체 생성 */
MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);
	
	/*  추가한 내용 담기위한 배열*/
	String title[]=mr.getParameterValues("title");
	String subtitle[]=mr.getParameterValues("subtitle");
	String picture[]= mr.getParameterValues("picture");
	String name=mr.getParameter("name");
	
	/* 추가한 이미지 파일들에 대한 Enumeration */	
	Enumeration formNames = mr.getFileNames();
	/*  추가한 데이터를 저장하기 위한 list */
	List<FacilityVO> list =new ArrayList<FacilityVO>();
	int number = 0;
	/*  이미지 파일의 요소만큼 배열을 돌려준다.  */
	while(formNames.hasMoreElements()){
		
		FacilityVO vo = new FacilityVO();
		//각 이미지 파일명 불러오기.
		String formName = (String)formNames.nextElement();
	 	String file = mr.getFilesystemName(formName); // 파일의 이름 얻기
		 
	 	//vo설정
		vo.setTitle(title[number]);
		vo.setSubtitle(subtitle[number]);
		vo.setName(name);
		vo.setFilename(file);	
	 	list.add(vo);
	 }
	
	new FacilityDAO().insert_other(list);
	
	 
	
	
%>
<script>
	location="../mainAdmin.jsp?page=facility_other";
</script>
</body>
</html>