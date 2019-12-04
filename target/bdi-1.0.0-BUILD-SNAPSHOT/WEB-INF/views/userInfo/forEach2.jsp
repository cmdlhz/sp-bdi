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
var jsonStr = '[{"uiNum":141,"uiNums":null,"uiName":"jamesddrd","active":"1","uiId":"jlim33rrd","uiPwd":"12345","moddat":"20191105","modtim":"145008","credat":"20191105","cretim":"145008","search":null,"searchStr":null}]';
var list = JSON.parse(jsonStr);
// console.log(list);
list.forEach(ui => {
	ui.id = ui.uiNum;
});

var list2 = [];
for(var ui of list){
	list2.push(ui);
}

list2[0].uiNum = 10;
console.log(list);
console.log(list2);
// 나를 바꾸는 건 안 되지만 내 안의 걸 바꾸는 건 된다.
</script>
</body>
</html>