<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<%@include file="/session/check_session.jsp"  %> 
</head>
<%-- 관리자일 경우 ismanager = true / 유저는 false --%>

<body>
	<form action="../board/noticeWritePro.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"/></td>
			</tr>	
			<tr>
				<td>작성자</td><!-- 관리자만 가능 -->
				<td><input type="text" name="id"/></td>
			</tr>
			<tr><td></td>
				<td><input type="checkbox" name="notice" value="1" checked="checked"/>공지사항</td>
			</tr>	
			<tr>
				<td>내용</td>
				<td><textarea cols="40" rows="10" name="content"></textarea></td>
			</tr>	
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="save" /></td>
			</tr>
		</table>
		<input type="submit" value="확인"/>
		<input type="button" value="목록보기" onclick="window.location.href='header.jsp?pgName=notice'"/>
	</form>
</body>
</html>