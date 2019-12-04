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
			<td data-id="uiNum"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td data-id="uiName"></td>
		</tr>
		<tr>
			<th>ID</th>
			<td data-id="uiId"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button class="btn btn-outline-warning" onclick="update(this)">수정</button>
				<button class="btn btn-outline-success" onclick="updateUser()">Submit</button>
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
// 			console.log(user);
			var tds = document.querySelectorAll('[data-id]');
			for(var td of tds){
				var col = td.getAttribute('data-id');
				td.innerHTML = user[col];
			}
		}
	}
	xhr.send();
}

function update(btn){
	var res = document.querySelectorAll('[data-id]');
	console.log(res);
	for(var i=0; i<res.length; i++){
		var id = res[i].getAttribute('data-id');
		console.log("id : " + id);
		console.log("user[id] : " + user[id]);
		res[i].innerHTML = '<input type="text" id="' + id + '" value="' + user[id] + '">'; 
	}
}

function updateUser(){
	var xhr = new XMLHttpRequest();
	xhr.open('PUT', '/user/list');
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			if(res.cnt == 1){
				location.href = '/views/user/list';
				alert('수정 성공!!');
			}
		}
	}
	
	console.log(document.querySelector('#uiNum'));
	console.log(document.querySelector('#uiName'));
	console.log(document.querySelector('#uiId'));
	
	var user = {
		uiNum : document.querySelector('#uiNum').value,
		uiName : document.querySelector('#uiName').value,
		uiId : document.querySelector('#uiId').value
	}
	xhr.send(JSON.stringify(user));
}

</script>
</body>
</html>