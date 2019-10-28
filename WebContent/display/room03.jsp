<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>방3</title>
<body>

	<div id="detail">
		<div>
			<resources mapping="/image/**" location="file:///C:/test/" />
			<resources mapping="/img/*" location="/img/" />
			<img src = "/display?name=${data.value.f_path}"/>
			<img src="<spring:url value='/image/first.jpg'/>" />
			<img src="../image/third.jpg" />
			
		</div>
		<div id="dr1">
			<p>언덕위에 펼쳐지는 별들의 여행 라 스텔라
			<br/><br/></p>			
			<hr><br/>
			<h3>Style</h3>
			<p>Four Rooms 30평 / 기준인원 4인 / 최대인원 8인</p><br/>
			<h3>Type</h3>
			<p>[복층형포룸]<br />
				1층 : 침대방2 + 거실 + 화장실2<br />
				2층 : 온돌방2 + 거실</p><br />
			<h3>Rooms Rates</h3>
			<p>비수기 평일: 300만원	비수기 금요일: 350만원	비수기 주말: 400만원<br/>
			성수기 평일: 320만원	성수기 금요일: 370만원	성수기 주말: 420만원</p><br/>
			<h3>Details</h3>
			<p>TV, 침대, 쇼파, 에어컨, 냉장고, 주방용품일체, 욕실용품 등  </p>
		</div>
	</div>
    
    
    
    
    
</body>
</html>