<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIST</title>
</head>
<body>
	<p>I'm the user list :)</p>

<%-- <c:forEach var="value" items="${userList}" varStatus="status"> --%>
<%--     <p>${status.count} : ${value} </p> --%>
<%-- </c:forEach> --%>

<ul>
	<c:forEach var="value" items="${userList}">
	    <li>${value}</li>
	</c:forEach>
</ul>
<br><br>
<%-- page : ${pageScope.userList}<br> --%>
<%-- req : ${requestScope.userList}<br> <!-- 여기만 나옴 --> --%>
<%-- session : ${sessionScope.userList}<br> --%>
<%-- app : ${applicationScope.userList}<br> --%>

</body>
</html>