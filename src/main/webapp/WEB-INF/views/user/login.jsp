<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
${user}
<div class="container">
	<h1>Log In</h1>
	<table class="table table-bordered">
	  <thead class="thead-light">
		<tr>
			<th>ID</th>
			<td><input type="text" id="uiId" placeholder="Enter ID."></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="number" id="uiPwd" placeholder="Enter Password."></td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="button" class="btn btn-outline-success" onclick="doLogin()">Log In</button>
				<button type="button" class="btn btn-outline-primary" onclick="goPage('/user/list')">목록</button>
			</th>
		</tr>
	  </thead>
	</table>
</div>
</body>
<script type="text/javascript">
function doLogin(){
	var param = {
		uiId : document.getElementById('uiId').value,
		uiPwd : document.getElementById('uiPwd').value
	}
	param = JSON.stringify(param);
// 	console.log("param stringify : " + param);
// 	console.log(typeof(param));
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/user/login');
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText); // DEBUG에 찍힘
// 			var res = JSON.parse(xhr.responseText);
// 			console.log(res.cnt); // 1
// 			console.log(res); // {cnt: "1"}
// 	 	 	if(res.cnt == 1){
// 	 	 		 location.href = '/views/user/list';
// 	 	 	}
		}

	}
	xhr.send(param);
}
</script>
</html>