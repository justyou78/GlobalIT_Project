<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		
		String sessionID = (String) session.getAttribute("id");
		/* 로그인 여부 확인 */
		if (sessionID == null) {
%>
				<script>
				alert('로그인 후 이용하실 수 있습니다.');
				window.location.href = '../login/login.jsp';
				</script>
<%
			return;
		}
%>
