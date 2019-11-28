<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax List</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>User list</h1>
	<div class="search">
		<label for="uiNum">번호</label> <input type="checkbox" id="uiNum" value="ui_num" name="search" />
		<label for="uiName">이름</label> <input type="checkbox" id="uiName" value="ui_name" name="search" />
		<label for="uiId">ID</label> <input type="checkbox" id="uiId" value="ui_id" name="search" />
		<input type="text" id="searchStr"><button class="btn btn-dark">검색</button>
	</div><br>
	<table class="table">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col">삭제</th>
	      <th scope="col">번호</th>
	      <th scope="col">이름</th>
	      <th scope="col">ID</th>
	      <th scope="col">credat</th>
	      <th scope="col">cretim</th>
	      <th scope="col">moddat</th>
	      <th scope="col">modtim</th>
	      <th scope="col">active</th>
	      <th scope="col">수정</th>
	    </tr>
	  </thead>
<!-- 	  <c:forEach items=${userList} var="user"> -->
<!-- 	  	<tr> -->
<%-- 	  		<td>${user.uiNum}</td> --%>
<!-- 	  	</tr> -->
<!-- 	  </c:forEach> -->
	  <tbody id="tBody"></tbody>
	</table>
	<button type="button" class="btn btn-outline-primary" onclick="goPage('/user/insert')">Sign Up</button>
	<button class="btn btn-outline-danger" onclick="deleteUsers()">삭제</button>
</div>
<script>
function deleteUsers(){
	var checks = document.querySelectorAll('input[name=remove]:checked');
	if(checks.length<1){
		alert('삭제할 사용자를 한명이상 선택해주세요');
		return;
	}
// 	var uiNums = [];
// 	for(var i=0; i<checks.length; i++){
// 		uiNums.push(checks[i].value);
// 	}
// 	console.log(uiNums);
	
// 	var param = {
// 		uiNums : uiNums
// 	}
// 	param = JSON.stringify(param);
// 	console.log(param);

	var uiNums = '';
	for(var i=0; i<checks.length; i++){
		uiNums += 'uiNums=' + [checks[i].value] + '&';
	}
	alert(uiNums);
	
	var xhr2 = new XMLHttpRequest();
	xhr2.open('DELETE', '/user/list?' + uiNums);
	xhr2.setRequestHeader('Content-Type','application/json');
	xhr2.onreadystatechange = function(){
		if(xhr2.readyState == 4 && xhr2.status == 200){
			var res = JSON.parse(xhr2.responseText);
			console.log(res);
	 	 	if(res.cnt != 0){
	 	 		 location.href = '/views/user/list';
	 	 	}
		}
	}
// 	xhr2.send(param);
	xhr2.send(uiNums);
}

function getUserList(param){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/list?' + param);
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
// 			console.log(xhr.responseText);
			var list = JSON.parse(xhr.responseText);
			var tBody = document.getElementById('tBody');
			var html = '';
			for(var user of list){
				html += '<tr>';
				html += '<td><input type="checkbox" name="remove" value="' + user.uiNum + '"></td>';
				html += '<td>' + user.uiNum + '</td>';
				html += '<td>' + user.uiName + '</td>';
				html += '<td>' + user.uiId + '</td>';
				html += '<td>' + user.credat + '</td>';
				html += '<td>' + user.cretim + '</td>';
				html += '<td>' + user.moddat + '</td>';
				html += '<td>' + user.modtim + '</td>';
				html += '<td>' + user.active + '</td>';
				html += '<td><a href="/views/user/view?uiNum=' + user.uiNum +'"><button class="btn btn-outline-warning">' + user.uiNum + '</button></a></td>';
				html += '</tr>';
			}
			tBody.innerHTML = html;
		}
	}
	xhr.send();
}
window.onload = function(){
	getUserList('');
	
	var btn = document.querySelector("button"); // 제일 처음에 있는 버튼
	btn.onclick = function(){
		var checks = document.querySelectorAll("[name=search]:checked");
		console.log(checks.length); // 체크된 갯수대로 숫자 찍힘
		if(checks.length == 0){
			alert("Please select at least one checkbox!");
			return;
		}
		var searchStr = document.querySelector("#searchStr");
		if(searchStr.value.trim().length < 1){
			alert("Please enter a search keyword!");
			return;
		}
		var search = '';
		for(var i=0; i<checks.length; i++){
			search += 'search=' + checks[i].value + '&';
		}
		search += 'searchStr=' + searchStr.value;
		console.log("search : " + search);
		getUserList(search);
	}
}
</script>
</body>
</html>