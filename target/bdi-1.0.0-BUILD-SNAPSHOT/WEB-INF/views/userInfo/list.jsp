<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<style>
div#userGrid{
	width: 402px;
	height: 300px;
}
</style>
</head>
<body>
	<h1>HELLO</h1>
	<div id="userGrid"></div>
	<button onclick="pickData()">DATA</button>
<script>
function pickData(){
	var row = grid.data.getItem(61);
	console.log(row);
}

var list = [];
var grid;
function getUserList(param){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/list?' + param);
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.onreadystatechange = function(){
		console.log(xhr.responseText);
		if(xhr.readyState == 4 && xhr.status == 200){
			list = JSON.parse(xhr.responseText);
			list.forEach(ui => {
				ui.id = ui.uiNum;	// row의 id
			});
			console.log(list);
			grid = new dhx.Grid('userGrid', {
				columns: [
					{width: 100, id: 'uiNum', header:[{text:'번호'}], editing:false},
					{width: 100, id: 'uiId', header:[{text:'ID'}]},
					{width: 100, id: 'uiName', header:[{text:'Name'}]},
					{width: 100, id: 'credat', header:[{text:'credat'}]}
				],
				headerRowHeight: 20,
				data: list,
				editing: true
			});
			grid.events.on('CellClick', function(row, column){
				console.log(row);
				console.log(column);
			});
		} else{
// 			console.log(xhr.responseText);
// 			alert("You need to login !!!!");
// 			location.href = "/views/user/login";
		}
	}
	xhr.send();
}
window.onload = function(){
	getUserList();
}
</script>
</body>
</html>