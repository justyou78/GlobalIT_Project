<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>원하는 수의 내용물을 추가해주세요</h3>
	<!--  시설물 추가를 위한 버튼
			버튼을 클릭하면 원하는 만큼 내용을 추가하도록 하는 버튼 -->
	<input type="button" value="추가" onclick="plus()" />
	<br />
	<!-- 시설물 추가 Form -->
	<form action=facility/facility_otherPro.jsp method="post"
		enctype="multipart/form-data"> <!--  facility_otherPro.jsp로 이동 -->
		<h3>내용 목록</h3>
		<select name="name"> <!--  어떤 시설을 추가할지 여부 -->
			<option value="관광지">관광지</option>
			<option value="부대시설">부대시설</option>
		</select>
		<div id="content"></div> <!-- 추가되는 목록을 보여주는 div -->
		<input type="submit" value="만들기" />
	</form>
</body>
<script>
	var num = 0;
	/* 추가되는 화면 */
	function plus() {
		num++;
		var val = content.innerHTML;

		var val2 = '<h3>이미지를 설정해주세요</h3>' 
				+ '<input type="file" name="picture'+num+'"/> <br/> ' /*  파일 추가 input */
				+ '제목 <input type="text" name="title"/> <br/>' /* 제목 추가 input */
				+ '부제목 <input type="text" name="subtitle"/> <br/>'; /* 부제목 추가 input  */
				
		/* 내용 추가 */
		content.innerHTML = val + val2;

	}
</script>
</html>