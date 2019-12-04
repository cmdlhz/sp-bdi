<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax REPEAT</title>
</head>
<body>
	<div id="buttonsDiv">
		<input type="text" id="search">
		<button>GET</button>
		<button>POST</button>
		<button>DELETE</button>
	</div>
	<div id="rDiv"></div>
<script>
var ajax = function(conf){
	var xhr = new XMLHttpRequest();
	xhr.open(conf.method, conf.url);
	if(conf.method != 'GET'){
		xhr.setRequestHeader('Content-Type', 'application/json');
	}
	xhr.onreadystatechange = function(){
		if(xhr.readyState == xhr.DONE && xhr.status == 200){
			conf.callback(xhr.responseText);
		}
	}
	xhr.send(conf.data);
}

window.onload = function(){
	var btns = document.querySelectorAll('button');
	for(var i=0; i<btns.length; i++){
		var btn = btns[i];
		if(btn.innerText == 'GET'){
			btn.onclick = function(){
				ajax({
					method: 'GET',
					url: '/ajaxRepeat?search=' + document.querySelector('#search').value,
					callback: function(res){
						res = JSON.parse(res);
						console.log("res : " + res);
						var html = '<ul>';
						for(var i=0; i<res.length; i++){
							html += '<li>' + res[i] + '</li>';
						}
						html += '</ul>';
						document.querySelector('#rDiv').innerHTML = html;
					}
				})
			}
		} else if(btn.innerText == 'POST'){
			btn.onclick = function(){
				var param = {
					search : document.querySelector('#search').value
				}
				ajax({
					method: 'POST',
					url: '/ajaxRepeat',
					callback: function(res){
						res = JSON.parse(res);
						console.log("res : " + res);
						var html = '<ul>';
						for(var i=0; i<res.length; i++){
							html += '<li>' + res[i] + '</li>';
						}
						html += '</ul>';
						document.querySelector('#rDiv').innerHTML = html;
					},
					data: JSON.stringify(param)
				})
			}
		} else { // 'DELETE'
			
		}
	}
}
</script>
</body>
</html>