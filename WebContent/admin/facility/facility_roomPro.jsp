<%@page import="globalit_pro.example.dao.FacilityDAO"%>
<%@page import="globalit_pro.example.dto.FacilityVO"%>
<%@page import="java.io.File"%>
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
	/* 이미지 저장 경로  */
	String path = request.getRealPath("admin/facility/picture");
	/*  파일 크기 */
	int max = 1024*1024*10; //10MB
	/* 인코딩 */
	String enc = "UTF-8";
	/* 파일이름정책 객체 */
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	/* MultipartRequest 객체 생성 */
	MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);
	
	//FacilityVO객체 생성
	FacilityVO vo = new FacilityVO();
	/* 데이터 초기화 */
	vo.setTitle(mr.getParameter("title"));
	vo.setSubtitle(mr.getParameter("subtitle"));
	vo.setRoom_type(mr.getParameter("room_type"));
	vo.setFacility_list(mr.getParameter("facility_list"));
	vo.setFilename(mr.getFilesystemName("picture"));
	vo.setName(mr.getParameter("name"));
	/*  DB 내용 삽입 */
	new FacilityDAO().insert_room(vo);
	/* 페이지 이동 */
	out.println("<script> location.href='../mainAdmin.jsp'</script>")	;
	
	
	
%>

	

</body>
</html>