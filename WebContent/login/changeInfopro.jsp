
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
<!--  MemberDTO 생성-->
<jsp:useBean id="dto" class="globalit_pro.example.dto.MemberDTO"></jsp:useBean>
<!--  MemberDTO에 변수 초기화-->
<jsp:setProperty property="*" name="dto"/>
	<%
		/*  입력한 비밀번호 변수 초기화*/
		String origin_pw = request.getParameter("origin_pw");
		MemberDAO dao= new MemberDAO();
		
		/* DB에 저장되어있는 비밀번호 초기화 */
		String pw =dao.getPw(dto.getId());
		//비밀번호 일치여부 확인
		if(pw.equals(origin_pw)){
				/* 회원정보 업데이트 Method */
				boolean result =dao.updateUser(dto);
				/*  성공시 */
				if(result){
					%>
					<script> alert("변경에 성공하셨습니다.");
						window.location="../display/header.jsp";
					</script>
					<%
				}
				/* 정보 업데이트 오류시 */
				else{
					%>
					<script> alert("오류가 발생하였습니다 다시 시도해주세요")
					history.go(-1);
					</script>
					<% 
					
				}
			
		
		}
		/* 입력한 비밀번호가 일치하지 않을 때 */
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