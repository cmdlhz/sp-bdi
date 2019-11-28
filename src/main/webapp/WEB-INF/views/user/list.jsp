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
	      <th scope="col">번호</th>
	      <th scope="col">이름</th>
	      <th scope="col">ID</th>
	      <th scope="col">credat</th>
	      <th scope="col">cretim</th>
	      <th scope="col">moddat</th>
	      <th scope="col">modtim</th>
	      <th scope="col">active</th>
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
	<button type="button" class="btn btn-outline-success" onclick="goPage('/user/update')">Update</button>
</div>
<script>
function getUserList(param){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/list?' + param);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
// 			console.log(xhr.responseText);
			var list = JSON.parse(xhr.responseText);
			var tBody = document.getElementById('tBody');
			var html = '';
			for(var user of list){
				html += '<tr>';
				html += '<td>' + user.uiNum + '</td>';
				html += '<td>' + user.uiName + '</td>';
				html += '<td>' + user.uiId + '</td>';
				html += '<td>' + user.credat + '</td>';
				html += '<td>' + user.cretim + '</td>';
				html += '<td>' + user.moddat + '</td>';
				html += '<td>' + user.modtim + '</td>';
				html += '<td>' + user.active + '</td>';
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