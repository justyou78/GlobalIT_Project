
<%@page import="globalit_pro.example.dto.MemberDTO"%>
<%@page import="globalit_pro.example.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="member" class="globalit_pro.example.dto.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="member" />
	
	<%
	
		MemberDAO dao = new MemberDAO();
	
		//카카오 로그인
		String export_email = request.getParameter("export_email");
		String export_nickname = request.getParameter("export_nickname");
		String export_id= request.getParameter("export_id");
		String where= request.getParameter("where");
	
		
		
		if(export_email != "" || export_nickname != ""){
				//로그인 과정
				String st = "";
				if(export_email ==null){
					export_email ="refuse";
				}
				
				
				
				
				
				
				//db에 저장되어있지 않다면 저장
				if(!dao.duplicateID(st)){
					System.out.println("진입");
					dao.exportJoin(export_id+"!"+export_email, export_nickname,where,export_id);
					
				}
				String auto = request.getParameter("auto");
				if (auto != null && auto.equals("on")) {
					Cookie c = new Cookie("id", st);
					c.setMaxAge(60 * 60 * 24);
					response.addCookie(c);
					
				}
				// 각 페이지별 로그인이 되었는지 확인하기 위한 세션 설정.
				session.setAttribute("id", export_id+"!"+export_email);
				
				%> 
				<script>
						alert("<%=export_nickname%>님 환영합니다.");
						window.location.href = 'main.jsp';
				</script>
				<%
				
			
			
				return;
			
		}
		
		
		
		
		
		
		//로그인 성공
		if (new MemberDAO().checkLogin(member)) {
			//자동로그인을 위한 쿠키 설정.
			String auto = request.getParameter("auto");
			if (auto != null && auto.equals("on")) {
				System.out.println("쿠키설정!");
				System.out.println(member.getId());
				Cookie c = new Cookie("ids", member.getId());
				
				c.setMaxAge(60 * 60 * 24);
				c.setPath("/");
				response.addCookie(c);
				System.out.println("성공");				
			}
			// 각 페이지별 로그인이 되었는지 확인하기 위한 세션 설정.
			session.setAttribute("id", member.getId());
			MemberDTO getMember=dao.getUser(member.getId());
	%>
	<script>
			alert("<%=getMember.getName()%>님 환영합니다.");
		window.location.href = '../display/header.jsp';
	</script>

	<%
		} else {
			out.print("<script> alert('잘못된 정보를 입력하셨습니다.')</script>");
			out.print("<script> history.go(-1);</script>");
		}
	%>
	
	
	


	
	
	
</body>
</html>