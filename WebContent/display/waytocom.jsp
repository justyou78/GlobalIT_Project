<%@page import="globalit_pro.example.dto.FacilityVO"%>
<%@page import="java.util.List"%>
<%@page import="globalit_pro.example.dao.FacilityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8"/>
	<title>오시는길</title>
</head>
<style>
	h3{
		text-decoration: underline;
		font-weight: bold;
		margin-bottom: 20px;
	}
</style>
<%
	FacilityDAO dao = new FacilityDAO();
	List<FacilityVO> list = null;
	String name = null;
%>
<body>
	<div class="container">
	<div id="map" style="width:1250px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7ba72873490200e7d1ddfa2d1e1db8f"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch('인천광역시 강화군 송해면 하도리 751-11(하도리 738번지) 라스텔라펜션', function(result, status){
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
				var infowindow = new kakao.maps.infoWindow({
					content: '<div style="width:150px;text-align:center;padding:6px 0;">라스텔라펜션</div>'
				});
				infowindow.open(map, marker);
				map.setCenter(coords);
			}
		});
	</script>
	
	<h3>01.기본정보</h3>
	<p>인천광역시 강화군 송해면 하도리 751-11 (하도리738번지)라스텔라펜션<br />
	010-1234-5678</p> <br />
	
	<h3>02.자가용이용시</h3>
	<p>- 서울방면 <br />
	서울을 기점으로 경부고속도로 끝지점에서 올림픽대로 김포공항쪽, 경부고속도로 끝지점에서 올림픽대로 김포공항방면, 서울외곽순환도로 김포 나들목에서 강화도를 연결하는 48번 국도를 이용. <br />
	올림픽도로 끝지점에서 강화 - 철산간 48번 도로 시작점에 접어드는 경우와 김포한강로를 이용할 수 있습니다.</p> <br />
	
	<p>- 김포공항방면 <br />
	김포공항(올림픽대로 끝지점)에서 강화읍까지 40분 ~ 1시간정도 소요됩니다. <br />
	인천에서는 경인고속도로 서인천 나들목에서 김포방면으로 검단, 양곡, 김포, 강화순으로 이정표도 잘 되어 있고 도로도 좋은편이라 쉽게 찾아오실 수 있습니다. <br />
	</p> <br />
	
	<h3>03.대중교통이용시</h3>
	<p>1.신촌터미널 - 강화터미널(직행) 약 1시간30분 소요(3000번) <br />
	운행시간 : 5시 40분 ~ 21시 30분(10~15분 간격) <br />
	탑승위치 : 신촌로터리에서 서강대교 방면으로 약 400m거리에 있음(청해수산 앞) - 지하철2호선 신촌역 7번 출구로 나오신 후 서강대교 쪽 약 100m지점에 강화행 시외버스탑승 - 강화터미널에서 하차 <br />
	경유장소 : 신촌 - 김포공항(송정 지하철역) - 고촌 - 김포터미널 - 마송 - 강화 </p><br />
	
	<p>2.인천/경기방면(인천/부천) <br />
	운행시간 : 6시 ~ 9시 30분(20분 간격) <br />
	탑승위치 : 중동 LG아파트 앞 터미널 <br />
	경유장소 : 부천 - 소사(혜진부페앞) - 부평(시장앞) - 계산동(홍진아파트) - 서인천고 - 서구청 - 검단4거리 - 마송 - 강화 <br />
	700번버스 : 인천종합터미널(신세계백화점 앞) - 길병원 - 희망백화점 - 간석오거리 - 동암역 - 가좌지주아파트 - 석남동(거북시장) - 형광아파트(가정오거리) - 강화대교 넘어서 하차 </p> <br />
	
	<p>3.영등포-강화터미널(완행) <br />
	영등포 신세계 백화점 맞은편 약 120m 아래 고가차도 부근 (약 1시간 40분 소요)</p> <br />

	<p>4.부평-강화터미널(완행)
	부평북부역 90번(약 1시간 40분 소요)</p> <br />
	
	<p>5.부천터미널-강화터미널(직행)
	중동 LG아파트 앞 터미널 33번(약 2시간 소요)</p> <br />
	
	
	
<%-- 	
	<%
	name = "오시는길";
	list = dao.select_other(name);
	for(FacilityVO vo : list){%>
		<h3><%= vo.getTitle()%></h3>
		<p><%=vo.getSubtitle() %></p> <br /> 
<%}%>
--%>
	</div>
</body>
</html>