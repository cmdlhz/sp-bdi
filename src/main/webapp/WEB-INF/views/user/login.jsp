<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<style>
div.container{
	height: 300px;
	width: 500px;
	border: 1px solid #000000;
}
</style>
</head>
<body>
${user}
<div class="container" id="loginForm">
<!-- 	<h1>Log In</h1> -->
<!-- 	<table class="table table-bordered"> -->
<!-- 	  <thead class="thead-light"> -->
<!-- 		<tr> -->
<!-- 			<th>ID</th> -->
<!-- 			<td><input type="text" id="uiId" placeholder="Enter ID."></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>Password</th> -->
<!-- 			<td><input type="number" id="uiPwd" placeholder="Enter Password."></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th colspan="2"> -->
<!-- 				<button type="button" class="btn btn-outline-success" onclick="doLogin()">Log In</button> -->
<!-- 				<button type="button" class="btn btn-outline-primary" onclick="goPage('/user/list')">목록</button> -->
<!-- 			</th> -->
<!-- 		</tr> -->
<!-- 	  </thead> -->
<!-- 	</table> -->
</div>
<div>
<!-- 	<button type="button" class="btn btn-outline-success" onclick="doLogin()">Log In</button> -->
	<button type="button" class="btn btn-outline-primary" onclick="goPage('/user/list')">목록</button>
</div>
</body>
<script type="text/javascript">
window.onload = function(){
	var dhWin = new dhx.Window({width: 500, height: 200, title:'Login'});
// 	dhWin.show();
	var form = new dhx.Form("loginForm", {
		cellCss: "dhx_widget--bordered",
		rows: [
			{
				type: "input",
				label: "ID",
				icon: "dxi dxi-magnify",
				placeholder: "ID를 입력해주세요",
				id: "uiId"
			},
			{
				type: "input",
				inputType: "password",
				label: "Password",
				placeholder: "비밀번호를 적어주세요.",
				id: "uiPwd"
			},
			{
				type: "button",
				value: "Log In",
				size: "medium",
				view: "flat",
				submit: true,
				color: "primary",
				id: "loginBtn"
			},
		]
	});
// 	var loginBtn = document.querySelector('#loginBtn');
// 	loginBtn.onclick = function(){
// 		alert('login 준비중!');
// 	}
	form.events.on('ButtonClick', function(id, e){
		if(id === 'loginBtn') doLogin();
	});
}

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
			if(xhr.responseText){
				var user = JSON.parse(xhr.responseText);
				alert("Welcome, " + user.uiName);
				location.href = "/views/userInfo/list";
			}
		}

	}
	xhr.send(param);
}
</script>
</html>