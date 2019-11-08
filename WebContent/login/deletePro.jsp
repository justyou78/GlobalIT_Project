
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
	/*  폼에서 입력한 비밀번호 */
	String getPw = request.getParameter("pw");
	
	/*  MemberDAO객체 생성*/
	MemberDAO dao = new MemberDAO();
	
	
	/*  DB에 저장되어 있는 비밀번호 초기화*/
	String pw = dao.getPw((String)session.getAttribute("id"));
	String id =(String)session.getAttribute("id"); 
	/*  입력한 비밀번호와 기존 비밀번호 일치여부 확인*/	
	if(pw.equals(getPw)){
		
		//쿠키 지워주기.
		Cookie[] cookies = request.getCookies();
		for(int i = 0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
			
		}
		//세션지워주기
		session.invalidate();
		
		//DB에서 계정 삭제.
		boolean result =new MemberDAO().deleteMember(id);
		
		/*  계정 삭제 성공 */
		if(result){
			%>
			<script>
				alert("삭제완료");
				window.location="main.jsp";
			
			</script>
			<%
		}
		/*  DAO처리 문제 발생시 */
		else{
			%>
			<script>
				alert("에러발생 다시시도해주세요.");
				history.go(-1);
			
			</script>
			<%
		}
		
	}
	//비밀번호 불일치
	else{
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