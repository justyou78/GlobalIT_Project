<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
function check() {
	var userinput = eval("document.userinput");
	if (userinput) {

	}

}
function confirmId(userinput) {
	if (userinput.id.value == "") {
		window.alert("아이디를 입력해주세요");
		return;
	}
	url = "confirm.jsp?id=" + userinput.id.value;
	open(
			url,
			"confirm",
			"toolbar=no, location=no, status=no,menubar=no, scrollbars=no, resizeable=no, width=300, heigth=200");
	
}
</script>


</head>

<body>

	<table>
		<tr>
			<td colspan="2" style="text-align: center">
				메뉴
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="layoutLeft.jsp" flush="false"/>
			</td>
			<td>
				<jsp:include page="join.jsp" flush="false"/>  
			</td>
		
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="layoutFooter.jsp" flush="false"/></td>
		</tr>
		  
		
	</table>

</body>
</html>