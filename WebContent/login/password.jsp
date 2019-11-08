<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/session/check_session.jsp"  %> 
</head>
<body>
		<div class="container">
		<h1 class="text-center" style="margin-top:30px;">비밀번호 변경</h1>
		<!-- <form action="passwordPro.jsp" method="post">
		기존 비밀번호 : <input type="password" name="origin_pw" /> <br/>
		새 비밀번호: <input type="password"  name="pw" /> <br/>
		새 비밀번호 확인.: <input type="password" name="pw_check" /> <br/>
		<input type="submit" value="변경"/>
		</form> -->
		
		
		<form action="passwordPro.jsp" method="post" style="margin-top:30px;">
  <div class="form-group">
    <label >기존 비밀번호</label>
    <input  type="password" name="origin_pw"   class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Original Password">
  </div>
  <div class="form-group">
    <label >새로운 비밀번호</label>
    <input type="password"  name="pw"  class="form-control" id="exampleInputPassword1" placeholder="New Password">
  </div>
  <div class="form-group">
    <label>새로운 비밀번호 확인</label>
    <input type="password"  name="pw_check"  class="form-control" id="exampleInputPassword1" placeholder="New Password Cehck">
  </div>
  <button type="submit" class="btn btn-primary">Change</button>
</form>
</div>
		
	
		  
</body>
</html>