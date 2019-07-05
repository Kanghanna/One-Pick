<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
2.jsp

<hr>
id : <%= config.getInitParameter("id") %>
pw : <%= config.getInitParameter("pw") %>
name : <%= config.getInitParameter("name") %>
<hr>
<%= application.getInitParameter("logEnabled") %>
<%= application.getInitParameter("debuglevel") %>
</body>
</html>