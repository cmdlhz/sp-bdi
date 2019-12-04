<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="search">
		<input type="text" id="searchName">
		<button>GET</button>
<!-- 		<button>SEARCH</button> -->
		<button>POST JSON</button><br>
		<button>DELETE JSON</button><br>
	</div>
	<button>POST Param</button>
	<div id="rDiv">
	
	</div>
<script>
var ajax = function(conf){
	var xhr = new XMLHttpRequest();
	xhr.open(conf.method, conf.url);
	if(conf.method != 'GET'){
// 		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.setRequestHeader('Content-Type', 'application/json');
	}
	xhr.onreadystatechange = function(){
		if(xhr.readyState == xhr.DONE){
			if(xhr.status == 200){
				conf.callback(xhr.responseText);
			}
		}
	}
	xhr.send(conf.data);
}

// var postJson = function(){
	
// }
// var postFile = function(){
	
// }
// var get = function(){
	
// }


window.onload = function(){
	var btns = document.querySelectorAll('button');
	for(var i =0; i<btns.length; i++){
		var btn  = btns[i];
		if(btn.innerText == 'GET'){
			btn.onclick = function(){
				ajax({
					method: 'GET', // 바디 영역 없음 (그래서 ?로 보낼 수 있을 뿐)
// 					url: '/ajax',
					url: '/ajax?searchName=' + document.querySelector('#searchName').value,
					callback: function(res){
						res = JSON.parse(res); // JSON 형태의 string
// 						alert(res.greeting);
						console.log("res : " + res);
						var html = '<ul>';
						for(var i=0; i<res.length;i++){
							html += '<li>' + res[i] + '</li>';
						}
						html += '</ul>';
						document.querySelector('#rDiv').innerHTML = html;
					}
				})
			}
		} else if(btn.innerText == 'SEARCH'){
			btn.onclick = function(){
// 				var searchName = document.querySelector('#searchName');
// 				var search = '';
// 				search += 'searchName=' + searchName.value;
// 				console.log("search : " + search);
				
				ajax({
					method: 'GET',
// 					url: '/ajax?' + search,
					url: '/ajax?searchName=' + document.querySelector('#searchName').value,
					callback: function(res){
						res = JSON.parse(res); // JSON 형태의 string
						console.log("res : " + res);
						var html = '<ul>';
						for(var i=0; i<res.length;i++){
							html += '<li>' + res[i] + '</li>';
						}
						html += '</ul>';
						document.querySelector('#rDiv').innerHTML = html;
					}
				})
			}
		} else if(btn.innerText == 'POST JSON'){
			btn.onclick = function(){
				var param = {
					searchName : document.querySelector('#searchName').value
				}
				ajax({
					method: 'POST',
					url: '/ajax/json',
// 					callback: function(res){
// 						res = JSON.parse(res);
// 						alert(res.greeting);
// 					},
					callback : function(res){
						res = JSON.parse(res); // JSON 형태의 string
						console.log("res : " + res);
						var html = '<ul>';
						for(var i=0; i<res.length;i++){
							html += '<li>' + res[i] + '</li>';
						}
						html += '</ul>';
						document.querySelector('#rDiv').innerHTML = html;
					},
					data: JSON.stringify(param)
				})
			}	
		} else if(btn.innerText == 'DELETE JSON'){
			btn.onclick = function(){
				var param = {
					searchName : document.querySelector('#searchName').value
				}
				ajax({
					method: 'DELETE',
					url: '/ajax',
					callback : function(res){
						res = JSON.parse(res); // JSON 형태의 string
						console.log("res : " + res);
						var html = '<ul>';
						for(var i=0; i<res.length;i++){
							html += '<li>' + res[i] + '</li>';
						}
						html += '</ul>';
						document.querySelector('#rDiv').innerHTML = html;
					},
					data: JSON.stringify(param)
				});
			}			
		} else {	
			btn.onclick = function(){
				var fd = new FormData();
				fd.append('a', 1);
				fd.append('b', 2);
				ajax({
					method: 'POST',
					url: '/ajax',
					callback: function(res){
						res = JSON.parse(res);
						alert(res.greeting);
					},
					data: fd
				})
			}			
		}
	}
	console.log(btns);
}

/*
 * static
 */
// var struck = {	// 메모리를 생성하지 않고도 구조를 만들기 위한 것
// 	a : 'abc'
// }
// alert(struck.a);

// 자바에서는
// class Struck{
// 	private static String a;
// 	public static void main(String[] args){
// 		Struck s = new Struck();
// 		System.out.println(Struck.a);
// 	}
// }


/*
 * public
 */
// var struck = function(){
// 	this.a = 'abc'
// }
// alert(struck.a);		// undefined

// 자바에서는
// class Struck{
// 	public String a;
// 	public static void main(String[] args){
// 		Struck s = new Struck();	// instance화르 시키지 않고 사용할 수 있는 건 static 뿐
// 		System.out.println(Struck.a); // compile도 안 됨
// 	}
// }

//에러가 나면 수정하기 굉장히 어려움 - 여러개의 library가 혼합되어 있어서
//$.ajax({
//	url: '/ajax',
//	method: 'GET',
//	success: function(res){
//		console.log(res);
//	}
//});

/*
 * 이론
 */
//var xhr2 = new XMLHttpRequest(); // 이건 메모리 생성 
//xhr2 = XMLHttpRequest(); // return 값을 주는 것, return할게 없으므로 undefined가 나옴
 
/*
 * 이론 2
 */
function clac(num1, num2, op){
	if(op == '+'){
		result = console.log(num1+num2);
	} else if(op == '-'){
		result = console.log(num1-num2);
	} 
	return result;
}

console.log(clac(10, 20, '+'));

/*
 * 이론 3
 */ 
function show(){
	return 1;
}
var t = show();
console.log(t); // 1
t = new show();
console.log(t); // Object object (메모리 생성한 걸 넣어줌)

var Test = function(){
	var a = "a"; // private
	this.log = function(){ // public('this'를 써서)
		console.log(a);
		log2();
	}
	var log2 = function(){
		console.log("b");
	}
}
var t = new Test();
t.log(t.a);

//자바에서는 이렇게
/*
public class Test{
	private String a = "a";
	public void log(){
		System.out.println(a);
	}
	public static void main(String[] args){
		Test t = new Test();
		// test t = new log(); // 이건 안 됨. method는 앞에 new 써서 호출이 안 됨
		t.log();
	}
}
 */

</script>
</body>
</html>