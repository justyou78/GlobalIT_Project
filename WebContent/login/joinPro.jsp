<%@page import="globalit_pro.example.dao.MemberDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="memberDto" class="globalit_pro.example.dto.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="memberDto"/>

<%
	String pwCheck =request.getParameter("pwCheck");
	MemberDAO memberDao = new MemberDAO();
	if(memberDao.duplicateID(memberDto.getId())){
		System.out.println("중복된아이디");
		%>
		<script>
			alert('이미 존재하는 아이디 입니다.');
			history.go(-1);
		
		
		</script>
	<%
	return;
	}
	if(!pwCheck.equals(memberDto.getPw())){
		%>
		<script>
			alert('비밀번호가 일치하지 않습니다..');
			history.go(-1);
			
		
		</script>
	<%
	return;
	}
	if(memberDao.joinMember(memberDto)){
		%>
			<script>
				alert('회원가입 되었습니다.');
				window.location.href='main.jsp';
			
			</script>
		<%
	}
	else{
		%>
		<script>
			alert('회원가입에 실패하였습니다 다시 시도해주세요.');
			history.go(-1);
		
		</script>
	<%
		
	}

		
	
		
	
%>


	

</head>
<body>


	

</body>
</html>