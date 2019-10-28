<%@page import="globalit_pro.example.dao.ReservationDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@include file="/session/check_session.jsp"  %> 
</head>
<body>
<%
	ReservationDAO dao = new ReservationDAO();
	/* 달력 */
	Calendar cal = Calendar.getInstance();

	String year = request.getParameter("year");	//년
	String month = request.getParameter("month");	//월
	String day = request.getParameter("day") == null ? null : request.getParameter("day");		//일
	String room_num = request.getParameter("room_num");	//방번호
	String id = request.getParameter("id");
%>

<script>
/* 	//int money = 방가격 * 머무는 일 수 ;	*/
 	//var money;	// 방 * 머무는 기간 = 값
 	//var check;	// 방을 선택했을 때
 	//방을 체크 했을 때 사용 요금 뜨게
 /* 	
 	document.addEventListener('DOMContentLoaded', function() {
 		  new Test();
 	 });
 	
 	function Test(){
        
  } */
  
 /*  ocument.addEventListener('DOMContentLoaded', function() {
	     
	     
     new Test();
  });
  function Test(){
	  money1=document.getElementById('money1');
	  money2=document.getElementById('money2');
	  
  }
 	Test.prototype.checkRoom(num){
 		
 		
 	} */
    
 	
 	
 	
  
  	function checkRoom(num){
 		if(num == 1){
 			console.log("페가수스");
 	
 			if(room1.checked){		// 페가수스 방을 선택했을 때
 				select1(); 			
 				//document.getElementById('money1').value = price1;
 			} else{
 				money1 = document.getElementById('money1').value = '';
 			} 			
 		
 		} else if(num == 2){
			console.log("오리온");
 			if(room2.checked){
 				select2();
 			} else{
 				money2 = document.getElementById('money2').value = ''; 				
 			}
 		} else if(num == 3){
 			console.log("카시오페아");
 			if(room3.checked){
 				select3();
 			} else{
 				money3 = document.getElementById('money3').value = '';
 			}
  		}//방 선택
 	}
 
 
 	/* 1번방 : 페가수스에서 머물 때 */
 	function select1(){	
 		var stayDay1 = document.getElementById('stayDay1').value;
 		var fee1 = document.getElementById('fee1').value;
 		price1 = stayDay1 * fee1;
 		document.getElementById("money1").value = price1; 	
 		totalPrice();
 	}
	
 	/* 2번방 : 오리온에서 머물 때 */
  	function select2(){
 		var stayDay2 = document.getElementById('stayDay2').value;
 		var fee2 = document.getElementById('fee2').value;
 		price2 = stayDay2 * fee2;
 		document.getElementById('money2').value = price2;
 		totalPrice();
 	}
 	
  	/* 3번방 : 카시오페아에서 머물 때 */
  	function select3(){
  		var stayDay3 = document.getElementById('stayDay3').value;
  		var fee3 = document.getElementById('fee3').value;
  		price3 = stayDay3 * fee3;
  		document.getElementById('money3').value = price3;
  		totalPrice();
  	}
  	
 	/* 전체 요금 */
 	function totalPrice(){
 		//방1
 		var stayDay1 = document.getElementById('stayDay1').value;
 		var fee1 = document.getElementById('fee1').value;
 		
 		console.log(stayDay1);
 		console.log(fee1);
 		
 		if(room1.checked){
 			price1 = stayDay1 * fee1;
 		}
 		else{
 			price1 = 0;
 		}
 		//방2
 		var stayDay2 = document.getElementById('stayDay2').value;
 		var fee2 = document.getElementById('fee2').value;
 		
 		console.log(stayDay2);
 		console.log(fee2);
 		
		if(room2.checked){
			price2 = stayDay2 * fee2;
 		}
 		else{
 			price2 = 0;
 		}
 		//방3
 		var stayDay3 = document.getElementById('stayDay3').value;
 		var fee3 = document.getElementById('fee3').value;
 		
 		console.log(stayDay3);
 		console.log(fee3);
 		
 		if(room3.checked){
 			price3 = stayDay3 * fee3;
 		} else{
 			price3 = 0;
 		}
 		
 		document.getElementById('totalMoney').value = (price1+price2+price3);
 		
 		
 		
 		
 		
 		 		//if(!room1.checked || room2.checked){
 			//각 방에 체크되어있지 않았을 때, 총 요금 =''
 		//	document.getElementById('totalMoney').value = '';
 		//} else {
 			//체크되어있는 방이 있을 때 총요금 ='금액'
	 /* 	if(room1.checked){	
 			select1();
	 		price1;
	 		var total = price1;
	 		document.getElementById('totalMoney').value = total;
	 	} else if(room2.checked){
	 		select2();
	 		price2; 			
	 		var total = price2;
	 		document.getElementById('totalMoney').value = total;
	 		
	 	} else if(room1.checked || room2.checked){
 			select1();
	 		select2();
	 		price1;
	 		price2; 			
	 		var total = price1 + price2;
	 		document.getElementById('totalMoney').value = total;	 		
	 	} */
 		//}
 		
 	}
 	
	function checkSM() {
		if(document.form01.day.value == null){
			alert("예약날짜를 확인하세요");
			return;
		}
	}
 	
 	
 	
</script>


<%if(day != null){ %>
<h1 class="text-center"><%=year %>년 <%=month %>월 <%=day %>일 예약 페이지 입니다.</h1>
<%}else{ %>
<h1 class="text-center">예약페이지</h1>
<%} %>
<form action="../booking/bookingPro_01.jsp" method="post" name="form01" onsubmit="return checkSM()">
	<div >아이디 :
	<input type="text" name="id" value="<%=id %>"/>
	</div>
	<input type="hidden" name="year" value="<%=year %>"/>
	<input type="hidden" name="month" value="<%=month %>"/>
	<input type="hidden" name="day" value="<%=day %>"/>
	<table class="table table-hover"   border="1">
		<thead class="thead-dark">
		<tr>
			<th>객실</th>
			<th>상태</th>
			<th>기준/최대</th>
			<th>이용기간</th>
			<th>이용인원</th>
			<th>기본요금</th>
			<th>이용요금</th>
		</tr>
		</thead>
		<tr>
			<td><input type="checkbox" name="room_num1" id="room1" value="1" onclick="checkRoom(1)"/>페가수스</td>
			<td>
			<%
				if(day != null){
					boolean result = dao.check(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day), 1);
					if(result){
						out.println("예약불가능");
					}else{
						out.println("예약가능");
					}					
				}else{
					out.println("날짜를 확인하세요");
				}
			%>
			</td>
			<td>65평형<br/>15명/20명</td>
			<td><select name="stayDay1" id="stayDay1" onchange="select1()">	<!-- 머무는 기간 -->
				<% for(int i= 1; i<7; i++){ %>
					<option value="<%=i %>"><%= i %>박</option>
				<% } %>
				</select>
			</td>
			<td>성인 <select name="adult">
				<% for(int i= 0; i<=15; i++){ %>
				<option value="<%= i %>"><%= i %></option>
				<%} %>
				</select><br/>
				유아 <select name="baby">
				<% for(int i= 0; i  <=20; i++){ %>
				<option value="<%= i %>"><%= i %></option>
				<%} %>
				</select><br/>
				아동 <select name="child">
				<% for(int i= 0; i<=20; i++){ %>
				<option value="<%= i %>"><%= i %></option>
				<%} %>
				</select>
			</td>
			
			<td><input type="hidden" name="money1" id="fee1" value="450000"/> 450,000원</td>
			<td>
				<input type="text" name="fee" id="money1" value="" readonly />
			</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="room_num2" id="room2" value="2" onclick="checkRoom(2)"/>오리온</td>
			<td><%
				if(day != null){
					boolean result = dao.check(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day), 2);
					if(result){
						out.println("예약불가능");
					}else{
						out.println("예약가능");
					}					
				}else{
					out.println("날짜를 확인하세요");
				}
			%></td>
			<td>40평형<br/>10명/15명</td>
			<td><select name="stayDay2" id="stayDay2" onchange="select2()"> <!-- 머무는 기간 -->
				<% for(int i= 1; i<7; i++){ %>
					<option value="<%=i %>"><%= i %>박</option>
				<% } %>
				</select>
			</td>
			<td>성인 <select name="adult">
				<% for(int i= 0; i<=15; i++){ %>
				<option value="<%= i %>"><%= i %></option>
				<%} %>
				</select><br/>
				유아 <select name="baby">
				<% for(int i= 0; i<=20; i++){ %>
				<option value="<%= i %>"><%= i %></option>
				<%} %>
				</select><br/>
				아동 <select name="child">
				<% for(int i= 0; i<=20; i++){ %>
				<option value="<%= i %>"><%= i %></option>
				<%} %>
				</select>
			</td>
			<td><input type="hidden" name="money2" id="fee2" value="190000"/>190,000원</td>
			<td>
				<input type="text" name="fee" id="money2" value="" readonly/>
			</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="room_num3" id="room3" value="3" onclick="checkRoom(3)"/>카시오페아</td>
			<td><%
				if(day != null){
					boolean result = dao.check(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day), 3);
					if(result){
						out.println("예약불가능");
					}else{
						out.println("예약가능");
					}					
				}else{
					out.println("날짜를 확인하세요");
				}
			%></td>
			<td>40평형<br/>10명/15명</td>
			<td><select name="stayDay3" id="stayDay3" onchange="select3()"> <!-- 머무는 기간 -->
				<% for(int i= 1; i<7; i++){ %>
					<option value="<%=i %>"><%= i %>박</option>
				<% } %>
				</select>
			</td>
			<td>성인 <select name="adult">
				<% for(int i= 0; i<=15; i++){ %>
				<option value="<%= i %>"><%= i %></option>
				<%} %>
				</select><br/>
				유아 <select name="baby">
				<% for(int i= 0; i<=20; i++){ %>
				<option value="<%= i %>"><%= i %></option>
				<%} %>
				</select><br/>
				아동 <select name="child">
				<% for(int i= 0; i<=20; i++){ %>
				<option value="<%= i %>"><%= i %></option>
				<%} %>
				</select>
			</td>
			
			<td><input type="hidden" name="money3" id="fee3" value="230000"/>230,000원</td>
			<td>
				<input type="text" name="fee" id="money3" value="" readonly/>
			</td>
		</tr>
		
		
	</table>
	<h3>전체 요금 : <input type="text" id="totalMoney" value="" placeholder="0" readonly/></h3>
				
	<br/><br/><br/><br/>
	<input class=btn type="submit" value="예약"/>
</form>
</html>