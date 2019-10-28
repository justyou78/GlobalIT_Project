
<%@page import="globalit_pro.example.dto.MemberDTO"%>
<%@page import="globalit_pro.example.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/session/check_session.jsp"  %> 
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String getPw = request.getParameter("pw");
	
	
	MemberDAO dao = new MemberDAO();
	
	
	
	String pw = dao.getPw((String)session.getAttribute("id"));
	String id =(String)session.getAttribute("id"); 
	//비밀번호 일치하는지 확인
	System.out.println(pw+"여기여기");
	System.out.println(id+"여기여기");
	
	if(pw.equals(getPw)){
		
		//쿠키 지워주기.
		Cookie[] cookies = request.getCookies();
		Cookie cooid =null, coopw =null;
		for(int i = 0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
			
		}
		//세션지워주기
		session.invalidate();
		
		//db에서 삭제.
		System.out.println("진입");
		boolean result =new MemberDAO().deleteMember(id);
		System.out.println("탈출");
		
		
		if(result){
			
					
			%>
			<script>
				alert("삭제완료");
				window.location="main.jsp";
			
			</script>
			<%
		}
		else{
			System.out.println("리설트02");
			%>
			<script>
				alert("에러발생 다시시도해주세요.");
				history.go(-1);
			
			</script>
			<%
		}
		
	}
	else{
		//비밀번호 불일치
		%>
		<script>
			alert("비밀번호가 일치하지 않습니다");
			history.go(-1);
		
		</script>
		<%
		
	}
	
	
%>
	

</body>
</html>