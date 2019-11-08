<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="globalit_pro.example.dao.FacilityDAO"%>
<%@page import="globalit_pro.example.dto.MemberDTO"%>
<%@page import="globalit_pro.example.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap   -->
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>



<style>
#header {
	height: 70px;
}

.subMenu {
	margin-top: 70px;
}

.carousel-inner {
	height: 450px;
}
</style>
<%
	/* 자동로그인을위한 쿠키 확인 및 세션 설정 */
	request.setCharacterEncoding("UTF-8");
	Cookie[] cookie = request.getCookies();
	String userid = null;
	if (cookie != null) {
		for (Cookie c : cookie) {
			if (c.getName().equals("ids")) {
				userid = c.getValue();
				session.setAttribute("id", userid);
			}
		}
	}
%>

</head>


<body>

	<!-- 헤드라인 -->
	<nav class="fixed-top navbar bg-dark " id="header">
		<h3>
			<!--  클릭시 홈화면으로 이동  -->
			<a href="header.jsp?pgName=main_Slide" class="text-white font-italic">GlobalIT
				펜션</a>
		</h3>


		<%
			String sid = (String) session.getAttribute("id");
			MemberDAO memberDao = new MemberDAO();
			/*  유저 이름을 가져오기위해 DTO변수 초기화 */
			MemberDTO memberDto = memberDao.getUser(sid);
			//로그인 상태 시
			if (sid != null) {
		%>
		<div class="float-right">
			<!--  관리자 일 경우 관리자 페이지로 이동하는 버튼 생성-->
			<%
				if (memberDto.getId().equals("admin")) {
			%>
			<button type="button"
				class="btn  btn-sm text-white btn-outline-info float-right"
				onclick="Manager()" height="50px">관리자</button>

			<%
				}
			%>
			<!-- 로그인 성공시 이름을 출력하고 각 회원정보수정 및 로그아웃 버튼 생성 -->
			<span class="text-white "><strong><%=memberDto.getName()%>님
					반갑습니다</strong></span>
			<button type="button"
				class="btn  btn-sm text-white btn-outline-info float-right"
				onclick="ChangeInfo()" height="50px">회원정보수정</button>
			<button type="button" class="btn  btn-sm text-white btn-outline-info"
				onclick="Logout()" height="50px">Logout</button>
		</div>
		<%
			}
			/* 로그인 하지 않았을 때 로그인 버튼과 회원가입 버튼 생성 */
			else {
		%>
		<div class="float-right">
			<button type="button" class="btn  btn-sm text-white btn-outline-info"
				onclick="Login()" height="50px">Login</button>
			<button type="button" class="btn  btn-sm text-white btn-outline-info"
				onclick="Join()" height="50px">Join</button>
		</div>
		<%
			}
		%>

	</nav>

	<!-- 서브라인  -->
	<div class="subMenu bg-warning">
		<ul class="nav justify-content-end bg-transparent">
			<li class="nav-item">
				<!-- 펜션 소개 dropdown -->
				<div class="dropdown">
					<a class="btn  btn-transparent  dropdown-toggle" href="#"
						role="button" id="dropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 펜션소개 </a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<!-- 오시는길 페이지로 이동 -->
						<a class="dropdown-item" href="header.jsp?pgName=wayToCome">오시는길</a>
					</div>
				</div>
			</li>
			<li class="nav-item"></li>
			<li class="nav-item">
				<!-- 방 소개 dropdown -->
				<div class="dropdown ">
					<a class="btn  dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 방소개 </a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<!--  관리자가 추가한 방들을 dropdown목록으로 나타낸다.-->
						<%
							FacilityDAO facilityDao = new FacilityDAO();
							List<String> roomList = facilityDao.select_Name();
							for (String st : roomList) {
						%>
						<a class="dropdown-item"
							href="header.jsp?pgName=room&roomName=<%=st%>"> <%=st%></a>
						<%
							}
						%>

					</div>
				</div>
			</li>
			<li class="nav-item">
				<!--  부대시설 dropdown-->
				<div class="dropdown">
					<a class="btn dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 부대시설 </a>
		
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<!--  부대시설 페이지로 이동-->
						<a class="dropdown-item" href="header.jsp?pgName=amenities">부대시설</a>
					</div>
				</div>
			</li>
			<li class="nav-item">
				<!--  관광지 dropdown-->
				<div class="dropdown">
					<a class="btn dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 관광지 </a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<!--  관광지 페이지로 이동-->
						<a class="dropdown-item" href="header.jsp?pgName=facility">관광지</a>
					</div>
				</div>
			</li>
			<li class="nav-item">
				<!--  예약 dropdown-->
				<div class="dropdown">
					<a class="btn dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 예약 </a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<!--  실시간 페이지로 이동-->
						<a class="dropdown-item" href="header.jsp?pgName=bookingReal">실시간예약</a>
						<!--  예약하기 페이지로 이동-->
						<a class="dropdown-item" href="header.jsp?pgName=bookingCal">예약하기</a>
						<!--  예약확인 페이지로 이동-->
						<a class="dropdown-item"
							href="header.jsp?pgName=bookingConfirmForm">예약확인/취소</a>
					</div>
				</div>
			</li>
			<li class="nav-item">
				<!--  게시판 dropdown-->
				<div class="dropdown">
					<a class="btn dropdown-toggle " href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 게시판 </a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<!--  공지사항 페이지로 이동-->
						<a class="dropdown-item" href="header.jsp?pgName=notice">공지사항</a>
						<!--  문의사항 페이지로 이동-->
						<a class="dropdown-item" href="header.jsp?pgName=board">문의사항</a>
					</div>
				</div>
			</li>
		</ul>
	</div>




	<!-- 메인페이지.  -->
	<!-- header.jsp 페이지는 변하지 않고 파라미터값만 변경시키며 display_main화면만 변경시킨다. (SPA)  -->
	<div class="display_main">
		<%
			String pgName = request.getParameter("pgName");

			if (pgName == null || pgName.equals("main_Slide")) {
		%>


		<jsp:include page="main_Slide.jsp"></jsp:include>
		<%
			} else if (pgName.equals("board")) {
		%>
		<jsp:include page="../board/boardList.jsp"></jsp:include>
		<%
			} else if (pgName.equals("booking")) {
		%>
		<jsp:include page="../booking/booking_02.jsp"></jsp:include>
		<%
			} else if (pgName.equals("bookingReal")) {
		%>
		<jsp:include page="../booking/bookingReal_02.jsp"></jsp:include>
		<%
			} else if (pgName.equals("bookingCal")) {
		%>
		<jsp:include page="../booking/bookingCal.jsp"></jsp:include>
		<%
			} else if (pgName.equals("siteMap")) {
		%>
		<jsp:include page="siteMap.jsp"></jsp:include>
		<%
			} else if (pgName.equals("wayToCome")) {
		%>
		<jsp:include page="waytocom.jsp"></jsp:include>
		<%
			} else if (pgName.equals("amenities")) {
		%>
		<jsp:include page="amenities.jsp"></jsp:include>
		<%
			} else if (pgName.equals("facility")) {
		%>
		<jsp:include page="facility.jsp"></jsp:include>
		<%
			} else if (pgName.equals("room")) {
		%>
		<jsp:include page="room.jsp"></jsp:include>
		<%
			}

			else if (pgName.equals("boardWrite")) {
		%>
		<jsp:include page="../board/boardWriteForm.jsp"></jsp:include>
		<%
			} else if (pgName.equals("notice")) {
		%>
		<jsp:include page="../board/noticeList.jsp"></jsp:include>
		<%
			} else if (pgName.equals("boardModify")) {
		%>
		<jsp:include page="../board/boardModifyForm.jsp"></jsp:include>
		<%
			} else if (pgName.equals("noticeModify")) {
		%>
		<jsp:include page="../board/noticeModifyForm.jsp"></jsp:include>
		<%
			} else if (pgName.equals("boardDelete")) {
		%>
		<jsp:include page="../board/boardDeleteForm.jsp"></jsp:include>
		<%
			} else if (pgName.equals("boardView")) {
		%>
		<jsp:include page="../board/boardView.jsp"></jsp:include>
		<%
			} else if (pgName.equals("noticeView")) {
		%>
		<jsp:include page="../board/noticeView.jsp"></jsp:include>
		<%
			} else if (pgName.equals("noticeWrite")) {
		%>
		<jsp:include page="../board/noticeWriteForm.jsp"></jsp:include>
		<%
			} else if (pgName.equals("bookingForm")) {
		%>
		<jsp:include page="../booking/bookingForm_01.jsp"></jsp:include>
		<%
			} else if (pgName.equals("login")) {
		%>
		<jsp:include page="../login/login.jsp"></jsp:include>
		<%
			}

			else if (pgName.equals("bookingConfirmForm")) {
		%>
		<jsp:include page="../booking/bookingComfirmForm.jsp"></jsp:include>
		<%
			}
		%>
	</div>

	<!-- 푸터 -->
	<div class="card text-center bg-dark ">
		<div class="card-header bg-warning font-italic text-white">Information</div>
		<div class="card-body ">
			<h5 class="card-title text-white  ">GlobalIT 펜션에오신걸 환영합니다~</h5>
			<p class="card-text text-white">010-1234-5678 문의 주세요</p>

		</div>

	</div>

	<script>
		/*  로그인 버튼 클릭시 */
		function Login() {
			window.location = '../login/login.jsp'
		}
		/*  회원정보수정 버튼 클릭시 */
		function ChangeInfo() {
			window.location = '../login/changeInfo.jsp'
		}
		/*  로그아웃 버튼 클릭시 */
		function Logout() {
			window.location = '../login/logoutpro.jsp'
		}
		/*  관리자 버튼 클릭시 */
		function Manager() {
			window.location = '../admin/mainAdmin.jsp'
		}
		/*  회원가입 버튼 클릭시 */
		function Join() {
			window.location = '../login/join.jsp'
		}
	</script>




</body>
</html>