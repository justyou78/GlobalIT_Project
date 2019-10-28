<%@page import="globalit_pro.example.dao.MemberDAO"%>
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
		Cookie[] cookie = request.getCookies();
		String userid = null, userpasswd = null;
		if (cookie != null) {
			for (Cookie c : cookie) {
				if (c.getName().equals("id")) {
					userid = c.getValue();
					session.setAttribute("id", userid);
				}
			
			}
		}
		String sid = (String)session.getAttribute("id");
		MemberDAO dao = new MemberDAO();
		if (sid != null) {
			
			out.print("<h3>" + dao.getUser(sid).getName()+ "님 환영합니다" + "<h3> <br/>");
	%>
	<button onclick="window.location.href='logoutpro.jsp'">로그아웃</button>
	<%if(dao.getUser(sid).getLogin_how().equals("0")){
		%>
			<button onclick="window.location.href='changeInfo.jsp'">정보수정하기</button>
		<%
		}
		

	
		} else {
			out.print("<h3>로그인해주세요<h3/>");
	%>
	<button onclick="window.location.href='login.jsp'">로그인</button>
	<button onclick="window.location.href='layoutMain.jsp'">회원가입</button>
	<%
		}
	%>
	<!-- 
		회원가입 다 만들고, 페이지 별 유효성 추가하기
		회원정보 수정 : 비밀번호 확인하고 수정하게 만들기
		전 페이지로 주소 들어 갔을 때 막기(로그인 안된 상태에서 접근 불가.
 -->
</body>
</html>