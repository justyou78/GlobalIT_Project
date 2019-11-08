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
	String id =(String)session.getAttribute("id");
	int stats=0;	//예약 상태 유무 1= 예약 가능
%>

<script>
	//방 체크박스 체크했을 때, 이용요금 표시
  	function checkRoom(num){
 		if(num == 1){
 			console.log("페가수스");
 			if(room1.checked){		// 페가수스 방을 선택했을 때
 				select1(); 			
 			} else{
 				money1 = document.getElementById('money1').value = '';
 				totalPrice();
 			} 			
 		} else if(num == 2){
			console.log("오리온");
 			if(room2.checked){
 				select2();
 			} else{
 				money2 = document.getElementById('money2').value = ''; 	
 				totalPrice();
 			}
 		} else if(num == 3){
 			console.log("카시오페아");
 			if(room3.checked){
 				select3();
 			} else{
 				money3 = document.getElementById('money3').value = '';
 				totalPrice();
 			}
  		}//방 선택
 	}
 
  	
 
 	/* 1번방 : 페가수스에서 머물 때 */
 	function select1(){   
       var stayDay1 = document.getElementById('stayDay1').value;   //숙박기간
       var fee1 = document.getElementById('fee1').value;         // 이용요금
       var adult1 = document.getElementById('adult1');      //성인 인원수
       var adultVal = adult1.options[adult1.selectedIndex].value;
       var plusFee1;
      if(adultVal > 15){
         for(var i = 15; i < adultVal; i++){
            plusFee1 = (adultVal-15)*10000;
         }
      } else{
         plusFee1 = 0;
      }
       
       price1 = stayDay1 * fee1 + plusFee1;   //숙박기간 * 이용요금 = 값
       document.getElementById("money1").value = price1;    
       totalPrice();
    }
    
    
    /* 2번방 : 오리온에서 머물 때 */
     function select2(){
       var stayDay2 = document.getElementById('stayDay2').value;
       var fee2 = document.getElementById('fee2').value;
       var adult2 = document.getElementById('adult2');      //성인 인원수
       var adultVal = adult1.options[adult2.selectedIndex].value;
       var plusFee2;
      if(adultVal > 10){
         for(var i = 10; i < adultVal; i++){
            plusFee2 = (adultVal-10)*10000;
         }
      } else{
         plusFee2 = 0;
      }
      
       price2 = stayDay2 * fee2 + plusFee2;
       document.getElementById('money2').value = price2;
       totalPrice();
    }
    
     /* 3번방 : 카시오페아에서 머물 때 */
     function select3(){
        var stayDay3 = document.getElementById('stayDay3').value;
        var fee3 = document.getElementById('fee3').value;
        var adult3 = document.getElementById('adult3');      //성인 인원수
       var adultVal = adult1.options[adult3.selectedIndex].value;
       var plusFee3;
      if(adultVal > 10){
         for(var i = 10; i < adultVal; i++){
            plusFee3 = (adultVal-10)*10000;
         }
      } else{
         plusFee3 = 0;
      }
      
        price3 = stayDay3 * fee3 + plusFee3;
        document.getElementById('money3').value = price3;
        totalPrice();
     }
    
    
     
    /* 전체 요금 */
    function totalPrice(){
       
       
          //방1
          var stayDay1 = document.getElementById('stayDay1').value;
          var fee1 = document.getElementById('fee1').value;
          var adult1 = document.getElementById('adult1');      //성인 인원수
          var adultVal = adult1.options[adult1.selectedIndex].value;
          var plusFee1;
         if(adultVal > 15){
            for(var i = 15; i < adultVal; i++){
               plusFee1 = (adultVal-15)*10000;
            }
         } else{
            plusFee1 = 0;
         }
         
          console.log(stayDay1);
          console.log(fee1);
          
          if(room1.checked){
             price1 = stayDay1 * fee1 + plusFee1;
          }
          else{
             price1 = 0;
          }
          
          
          //방2
          var stayDay2 = document.getElementById('stayDay2').value;
          var fee2 = document.getElementById('fee2').value;
          var adult2 = document.getElementById('adult2');      //성인 인원수
          var adultVal = adult2.options[adult2.selectedIndex].value;
          var plusFee2;
         if(adultVal > 10){
            for(var i = 10; i < adultVal; i++){
               plusFee2 = (adultVal-10)*10000;
            }
         } else{
            plusFee2 = 0;
         }
          console.log(stayDay2);
          console.log(fee2);
          
         if(room2.checked){
            price2 = stayDay2 * fee2 + plusFee2;
          }
          else{
             price2 = 0;
          }
          //방3
          var stayDay3 = document.getElementById('stayDay3').value;
          var fee3 = document.getElementById('fee3').value;
          var adult3 = document.getElementById('adult3');      //성인 인원수
          var adultVal = adult3.options[adult3.selectedIndex].value;
          var plusFee3;
         if(adultVal > 10){
            for(var i = 10; i < adultVal; i++){
               plusFee3 = (adultVal-10)*10000;
            }
         } else{
            plusFee3 = 0;
         }
          console.log(stayDay3);
          console.log(fee3);
          
          if(room3.checked){
             price3 = stayDay3 * fee3 + plusFee3;
          } else{
             price3 = 0;
          }
       
          document.getElementById('totalMoney').value = (price1+price2+price3);      
   
    }//totalPrice()
 
 	// 유효성 검사	
	function checkSM() {
 		var form01 = document.form01;
		if(!form01.day.value){
			alert("예약날짜를 확인하세요");
			return false;
		}
		if(!form01.room_num1.checked && !form01.room_num2.checked && !form01.room_num3.checked){
			alert("예약하실 방을 선택해주세요.");
			return false;
		}
	}
 	

</script>


<%if(day != null){ %>
<h1><%=year %>년 <%=month %>월 <%=day %>일 예약 페이지 입니다.</h1>
<%}else{ %>
<h1>예약페이지</h1>
<%} %>
<form action="../booking/bookingPro_01.jsp" method="post" name="form01" onsubmit="return checkSM()">
	<input type="hidden" name="id" value="<%=id%>"/>
	<input type="hidden" name="year" value="<%=year %>"/>
	<input type="hidden" name="month" value="<%=month %>"/>
	<input type="hidden" name="day" value="<%=day %>"/>
	<table class="table table-hover" border="1">
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
					stats = dao.checkStats(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day), 1);
					
					if(stats == 1){
						out.println("예약가능");
					}else{
						out.println("예약불가능");		%>
				<script>$('#room1').attr("disabled",true);</script>
			<%		}					
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
			<td>성인 <select name="adult" id="adult1" onchange="select1()">
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
					stats = dao.checkStats(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day), 2);
					
					
					if(stats == 1){
						out.println("예약가능");
					}else{
						out.println("예약불가능");		%>
				<script>$('#room2').attr("disabled",true);</script>
			<%		}					
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
				<td>성인 <select name="adult" id="adult2" onchange="select2()">
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
					stats = dao.checkStats(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day), 3);
					
					if(stats == 1){
						out.println("예약가능");
					}else{
						out.println("예약불가능");		%>
				<script>$('#room3').attr("disabled",true);</script>
			<%		}					
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
			
			<td>성인 <select name="adult" id="adult3" onchange="select3()">
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
	<div class="float-right">
	전체 요금 : <input type="text" id="totalMoney" value="" placeholder="0" readonly/> <input class="btn btn-danger"  type="submit" value="예약"/>
	</div>			
	<br/><br/><br/><br/>
	
</form>
</html>