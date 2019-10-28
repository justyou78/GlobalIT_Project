<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<script>
	$(document).ready(function(){
		window.setInterval("time()",1000);
		
	});
	function time(){
		$.ajax({
			type:"post",
			url: "time.jsp",
			data : {num : 100},
			success : function(data){
				$("#result").html(data);
			}
		});
		
		
	}
	
	function time(){
		$.ajax({
			type:"post",
			url: "time.jsp"
			success : function(data){
				$("#result").html(data);
			}
		});
		
		
	}
</script>
	<%=request.getParameter("num") %>

</html>