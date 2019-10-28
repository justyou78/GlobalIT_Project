<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
 
</head>
<body>


	<form action="loginpro.jsp" method="post" name=login_form>
		id : <input type="text" name="id" /> <br />
		 pw : <input type="password" name="pw" /> <br />
		<input type="hidden" name="export_email" />
		 <input type="hidden" name="export_nickname" />
		<input type="hidden" name="export_id" />
		<input type="hidden" name="where" />
		<input type="submit" value="로그인"> 자동로그인<input type="checkbox" name="auto" />
	</form>
	
	
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>
	
	
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naverIdLogin"></div>
	<!-- //네이버아이디로로그인 버튼 노출 영역 -->

	
	
	<!-- 네이버아디디로로그인 초기화 Script -->
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
						console.log(res);
						<%  %>
		var userID = res.id;
										var userEmail = res.kaccount_email; //유저의 이메일
										var userNickName = res.properties.nickname; //유저가 등록한 별명

										console.log(userID);
										console.log(userEmail);
										console.log(userNickName);

										document.login_form.export_email.value = userEmail;
										document.login_form.export_nickname.value = userNickName;
										document.login_form.export_id.value = userID;
										document.login_form.where.value = 1;

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