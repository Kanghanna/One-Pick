<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String nation = request.getParameter("nation");
%>

<%= "U20 월드컵 결승진출 " + nation %>
</body>
</html>