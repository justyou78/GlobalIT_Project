<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
 
</head>
<body>
	<div class="container">
	<!-- 로그인 폼 -->
	<form action="loginpro.jsp" method="post" name=login_form> <!-- loginpro.jsp로 이동 -->
  <div class="form-group">
    <label >ID</label> 
    <input type="text" name="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ID"> <!--  아이디-->
  </div>
  <div class="form-group">
    <label>Password</label>
    <input type="password"  name="pw"  class="form-control" id="exampleInputPassword1" placeholder="Password"> <!-- 비밀번호  -->
  </div>
  <!-- API로 접속 했을 경우 히든으로 데이터 정보를 넘겨준다. -->
  <input type="hidden" name="export_email" />
		 <input type="hidden" name="export_nickname" />
		<input type="hidden" name="export_id" />
		<input type="hidden" name="where" />
		<div class="float-right">
		 자동로그인<input type="checkbox" name="auto" /> <!--  자동 로그인 Check box-->
  <button type="submit" class="btn btn-primary">로그인</button>
  </div>
</form>
	<!-- 카카오 로그인 버튼 -->
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>
	
	
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naverIdLogin"></div>
	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
	</div>
	
	
	<!-- 네이버아디디로로그인 초기화 Script -->
	<!--  naver_loginpro.jsp로 이동-->
	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "hxTM_SB45etOZ_YINBji",
				callbackUrl: "http://localhost:80/GlobalIT_Pro/login/naver_loginpro.jsp",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		
	</script>
	
	
	<!--카카오 로그인  -->
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('04d0951d795a2e0e3490f940515593b2');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				//alert(JSON.stringify(authObj));
				
				//로그인 성공시, API를 호출.
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res){
										var userID = res.id;
										var userEmail = res.kaccount_email; //유저의 이메일
										var userNickName = res.properties.nickname; //유저가 등록한 별명

										/* hidden값에 데이터 삽입. */
										document.login_form.export_email.value = userEmail;
										document.login_form.export_nickname.value = userNickName;
										document.login_form.export_id.value = userID;
										document.login_form.where.value = 1;
										/*  loginpro.jsp로 이동 */
										document.login_form.submit();

									},
									fail : function(error) {
										alert(JSON.stringify(error));
									}
								});

					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});
		//]]>
	</script>

</body>
</html>