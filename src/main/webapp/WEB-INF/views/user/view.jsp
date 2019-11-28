<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Single Page</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
${param.uiNum}
<div class="container">
	<h1>View</h1>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<td data-col="uiNum"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td data-col="uiName"></td>
		</tr>
		<tr>
			<th>ID</th>
			<td data-col="uiId"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button class="btn btn-outline-warning" onclick="update(this)')">수정</button>
				<button class="btn btn-outline-info" onclick="goPage('/user/list')">목록</button>
			</th>
		</tr>
	</table>
</div>
<script>
var user;
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/view?uiNum=${param.uiNum}');
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			user = JSON.parse(xhr.responseText);
			console.log(user);
			var tds = document.querySelectorAll('[data-col]');
			for(var td of tds){
				var col = td.getAttribute('data-col');
				td.innerHTML = user[col];
			}
		}
	}
	xhr.send();
}
</script>
</body>
</html>