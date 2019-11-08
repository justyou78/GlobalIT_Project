
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
	<!-- memberDTO 생성 -->
	<jsp:useBean id="member" class="globalit_pro.example.dto.MemberDTO"></jsp:useBean>
	<!-- memberDTO에 데이터 삽입. -->
	<jsp:setProperty property="*" name="member" />
	
	<%
		/*  MemberDAO 객체 생성*/
		MemberDAO dao = new MemberDAO();
	
		//API로그인시 변수 초기화
		String export_email = request.getParameter("export_email");
		String export_nickname = request.getParameter("export_nickname");
		String export_id= request.getParameter("export_id");
		String where= request.getParameter("where");
	
		
		/*  API로 로그인 했을 경우 */
		if(export_email != "" || export_nickname != ""){
				//로그인 과정
				String st = "";
				/*  API의 경우 Email을 가져 오지 못하는 경우가 있을 수 있다.
					Database에 ID값은 기본키로 필수적으로 존재해야한다.
					email 정보를 가져오지 못한다면  email을 refuse로 초기화
				*/
				if(export_email ==null){
					export_email ="refuse";
				}
				//db에 저장되어있지 않다면 사용자 정보를 저장한다.
				if(!dao.duplicateID(st)){
					System.out.println("진입");
					dao.exportJoin(export_id+"!"+export_email, export_nickname,where,export_id);
					
				}
				/*  중복 로그인이 체크되어있는지 확인. */
				String auto = request.getParameter("auto");
				if (auto != null && auto.equals("on")) {
					/* 자동로그인을 위한 쿠키 설정. */
					Cookie c = new Cookie("id", st);
					c.setPath("/");
					c.setMaxAge(60 * 60 * 24);
					response.addCookie(c);
					
				}
				// 로그인 상태를 유지시키기 위해 세션 설정.
				session.setAttribute("id", export_id+"!"+export_email);
				
				%> 
				<script>
						/*  성공후 메세지 및 화면 이동 처리*/
						alert("<%=export_nickname%>님 환영합니다.");
						window.location.href = '../display/header.jsp';
				</script>
				<%
				return;
			
		}
		
		
		
		
		
		
		/* 일반 로그인 시 회원인지 확인. */
		if (new MemberDAO().checkLogin(member)) {
			//자동로그인 체크 여부 확인.
			String auto = request.getParameter("auto");
			if (auto != null && auto.equals("on")) {
				//자동 로그인을 위한 쿠키 설정.
				Cookie c = new Cookie("ids", member.getId());
				
				c.setMaxAge(60 * 60 * 24);
				c.setPath("/");
				response.addCookie(c);
			}
			// 로그인 상태를 유지시키기 위해 세션 설정.
			session.setAttribute("id", member.getId());
			/* 로그인 성공햇을 때 이름값을 가져오기 위해 DTO객체 생성 */
			MemberDTO getMember=dao.getUser(member.getId());
	%>
	<script>
		/* 이름을 출력한뒤 화면 이동  */
		alert("<%=getMember.getName()%>님 환영합니다.");
		window.location.href = '../display/header.jsp';
	</script>

	<%
		/*  로그인 실패  */ 
		} else {
			out.print("<script> alert('잘못된 정보를 입력하셨습니다.')</script>");
			out.print("<script> history.go(-1);</script>");
		}
	%>
	
	
	


	
	
	
</body>
</html>