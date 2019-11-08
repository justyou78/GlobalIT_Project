<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>방 만들기</h3>
	<!-- 방 추가 폼 -->
	<form action=facility/facility_roomPro.jsp method="post" enctype="multipart/form-data">	
		방이름 <input type="text" name="name"/> <br/> <!-- 방 이름  -->
		<h3>메인이미지를 설정해주세요</h3>
		file : <input type="file" name="picture"/><br/>  <!-- 이미지 파일  -->
		제목 <input type="text" name="title"/> <br/> <!-- 제목 -->
		부제목 <input type="text" name="subtitle"/> <br/> <!-- 부제목 -->
		방구조 <br/>
		 <textarea rows="10" cols="60" name="room_type"></textarea> <br/> <!-- 방 구조 -->
		편의시설 <br/>
		<textarea rows="10" cols="60" name="facility_list"></textarea> <br/> <!-- 편의 시설 -->
		
		<input type="submit" value="방생성"/>
	</form>
	
</body>
</html>