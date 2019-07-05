<%@page import="java.net.URLEncoder"%>
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
	String name = "홍길동";
	String encName = URLEncoder.encode(name, "utf-8"); //값을 직접 인코딩
	response.sendRedirect("index.jsp?name=" + encName);
%>
</body>
</html>