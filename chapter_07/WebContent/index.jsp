<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
6/27<hr>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
%>
index 페이지 <br>
<hr>
<%= name %>님 환영합니다.
</body>
</html>