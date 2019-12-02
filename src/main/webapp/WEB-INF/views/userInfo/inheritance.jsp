<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var arr = new Array();
arr = [];
arr.push(1);

function Father(){
	this.test = function(){
		console.log('test of Father');
	}
}
var f = new Father();
f.__proto__.test1 = function(){
	console.log('test of Son'); 
}
f.test();		// test of Father
f.test1();		// test of Son




var arr = new Array();
Array.prototype.fors = function(){
	console.log("fors() method!");
}
arr.fors();		// fors() method!

</script>
</body>
</html>