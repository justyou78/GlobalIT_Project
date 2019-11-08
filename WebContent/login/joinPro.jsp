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
<!--  회원가입 DTO객체-->
<jsp:useBean id="memberDto" class="globalit_pro.example.dto.MemberDTO"></jsp:useBean> 
<!--  DTO에 데이터 삽입 -->
<jsp:setProperty property="*" name="memberDto"/>

<%
	/*  비밀번호 확인을위한 변수 생성 */
	String pwCheck =request.getParameter("pwCheck");
	/* 데이터 처리를 위한 memberDAO객체 생성  */
	MemberDAO memberDao = new MemberDAO();
	/* 데이터가 중복된 것인지 확인 */
	if(memberDao.duplicateID(memberDto.getId())){
		%>
		<script>
			
			alert('이미 존재하는 아이디 입니다.');
			history.go(-1);
		
		
		</script>
	<%
	return;
	}
	/* 비밀번호와 비밀번호 확인이 일치하는지 확인.  */
	if(!pwCheck.equals(memberDto.getPw())){
		%>
		<script>
			alert('비밀번호가 일치하지 않습니다..');
			history.go(-1);
			
		
		</script>
	<%
	return;
	}
	/* 회원가입이 성공했을 때 */
	if(memberDao.joinMember(memberDto)){
		%>
			<script>
				alert('회원가입 되었습니다.');
				window.location.href='../display/header.jsp';
			
			</script>
		<%
	}
	/* DB에 문생가 발생하였을 때 */
	else{
		%>
		<!-- d -->
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