
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
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="globalit_pro.example.dto.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
	<%
		
		String origin_pw = request.getParameter("origin_pw");
		MemberDAO dao= new MemberDAO();
		
		String pwCheck = request.getParameter("pwcheck");
		
		String pw =dao.getPw(dto.getId());
		//기존 비밀번호가 일치하는지 확인.
		if(pw.equals(origin_pw)){
			System.out.println("비밀번호일치");
			
			
				
			
			
				boolean result =dao.updateUser(dto);
				if(result){
					System.out.println("리설트 진입");
					
					
					%>
					<script> alert("변경에 성공하셨습니다.");
						window.location="main.jsp";
					</script>
					<%
				}
				else{
					%>
					<script> alert("오류가 발생하였습니다 다시 시도해주세요")
					history.go(-1);
					</script>
					<% 
					
				}
			
		
		}
		else{
			%>
				<script>
					alert("기존비밀번호가 일치하지 않습니다");
					history.go(-1);
				
				</script>
			<%
		}
		
	
	%>
	

</body>
</html>