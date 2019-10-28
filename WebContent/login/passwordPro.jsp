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
		String origin_pw =request.getParameter("origin_pw");
		String pw = request.getParameter("pw");
		String pw_check = request.getParameter("pw_check");
		
		MemberDAO dao = new MemberDAO();
		String result = dao.changePw((String)session.getAttribute("id"),origin_pw,pw,pw_check);
	
		
		if(result.equals("성공")){
			//세션 변경
			
			//쿠키 변경.
			Cookie[] cookie  = request.getCookies();
			if(cookie !=null){
				for(Cookie c : cookie){
					if(c.getName().equals("pw")){
						c.setValue(pw);
					}
				}
			}
			
			
			
			%>
				<script>
					alert("비밀번호를 변경하였습니다.");
					window.location="main.jsp";
				</script>
			<% 
		}
		else if(result.equals("새로운비밀번호불일치")){
			%>
				<script>
					alert("새로운 비밀번호가 일치하지 않습니다.");
					history.go(-1);
				</script>
			<%
		}
		else{
			%>
					<script>
					alert("기존의 비밀번호가 일치하지 않습니다..");
					history.go(-1);
				</script>
			
			
			<%
			
		}

%>

</body>
</html>