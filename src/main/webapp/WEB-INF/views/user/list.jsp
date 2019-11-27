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
	<h1>Ajax list</h1>
	<table class="table">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col">#</th>
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
	<button type="button" class="btn btn-outline-primary" onclick="goPage('/user/ajax/insert')">글쓰기</button>
	<button type="button" class="btn btn-outline-success" onclick="goPage('/user/ajax/update')">Update</button>
</div>
<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/ajax/list');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText);
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
</script>
</body>
</html>