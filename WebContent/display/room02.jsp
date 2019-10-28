<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>방2</title>
<body>

	<div id="detail">
		<div>
			<resources mapping="/image/**" location="file:///C:/test/" />
			<resources mapping="/img/*" location="/img/" />
			<img src = "/display?name=${data.value.f_path}"/>
			<img src="<spring:url value='/image/first.jpg'/>" />
			<img src="../image/second.jpg" />
			
		</div>
		<div id="dr1">
			<p>언덕위에 펼쳐지는 별들의 여행 라 스텔라
			<br/><br/></p>			
			<hr><br/>
			<h3>Style</h3>
			<p>Three Rooms 20평 / 기준인원 3인 / 최대인원 5인</p><br/>
			<h3>Type</h3>
			<p>[복층형쓰리룸]<br />
				1층 : 온돌룸2 + 거실 + 주방 + 화장실<br />
				2층 : 침대방1 + 거실</p><br />
			<h3>Rooms Rates</h3>
			<p>비수기 평일: 200만원	비수기 금요일: 250만원	비수기 주말: 300만원<br/>
			성수기 평일: 220만원	성수기 금요일: 270만원	성수기 주말: 320만원</p><br/>
			<h3>Details</h3>
			<p>TV, 침대, 쇼파, 에어컨, 냉장고, 주방용품일체, 욕실용품 등  </p>
		</div>
	</div>
    
    
    
    
    
</body>
</html>