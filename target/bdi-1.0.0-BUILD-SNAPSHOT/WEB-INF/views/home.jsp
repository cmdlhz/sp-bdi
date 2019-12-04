<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<c:forEach var="value" items="${strList}" varStatus="status">
    <p>${status.count} : ${value} </p>
</c:forEach>

<c:forEach var="value" items="${strList}">
    <li>${value}</li>
</c:forEach>
</body>
</html>

