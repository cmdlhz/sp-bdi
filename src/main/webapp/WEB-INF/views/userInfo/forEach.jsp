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
var arr = [];
arr.push(1);
arr.push(2);
arr.push(3);
// arr.forEach(i => console.log(i));	// 1 // 2 // 3

var arr2 = [];
arr2.push({name:'jen', num: 1});
arr2.push({name:'kim', num: 2});
arr2.push({name:'ashley', num: 3});
arr2.forEach(i => {
	i.id = i.num;
// 	console.log(i);
});

var arr3 = [];
Array.prototype.forEach2 = function(func){
	for(var row of this){
		func(row);
	}
}
arr3.push({name:'jen', num: 1});
arr3.push({name:'kim', num: 2});
arr3.push({name:'ashley', num: 3});
arr3.forEach2(i => {
	i.id = i.num;
	console.log(i);
});

var test = function(){
	window.console.log("window");
}
window.test();		// window
</script>
</body>























</html>