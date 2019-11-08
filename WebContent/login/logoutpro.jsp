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
	 		Cookie[] coo = request.getCookies();
	 		/* 쿠키 삭제 */
	 		for(Cookie c : coo){
	 			if(c.getName().equals("id")){
	 				c.setMaxAge(0);
	 				response.addCookie(c);
	 			}
	 		}
	 		/*  세션 삭제 */
	 		session.invalidate();
	 %>
	 <!-- 페이지 이동 -->
	 <script> window.location.href="../display/header.jsp"</script>

</body>
</html>