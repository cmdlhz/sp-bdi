<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Data</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>Insert Data</h1>
	<table class="table table-bordered">
	  <thead class="thead-light">
	    <tr>
			<th>이름</th>
			<td><input type="text" id="uiName" placeholder="이름을 입력해주세요."></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><input type="text" id="uiId" placeholder="ID를 입력해주세요."></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="number" id="uiPwd"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="button" class="btn btn-outline-success" onclick="save()">저장</button>
				<button type="button" class="btn btn-outline-primary" onclick="goPage('/user/list')">목록</button>
			</th>
		</tr>
	  </thead>
	</table>
</div>
</body>
<script type="text/javascript">
function save(){
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/user/list');
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText); // {"cnt":"1"}
			var res = JSON.parse(xhr.responseText);
			console.log(res.cnt); // 1
			console.log(res); // {cnt: "1"}
	 	 	if(res.cnt == 1){
	 	 		 location.href = '/views/user/list';
	 	 	}
		}

	}
	var param = {
		uiName : document.getElementById('uiName').value,
		uiId : document.getElementById('uiId').value,
		uiPwd : document.getElementById('uiPwd').value
	}
	param = JSON.stringify(param);
	console.log("param stringify : " + param);
	console.log(typeof(param));
	xhr.send(param);
}
</script>
</html>