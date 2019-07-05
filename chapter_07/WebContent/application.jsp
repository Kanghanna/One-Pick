<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
6/20<hr>

getServerInfo() : <%= application.getServerInfo() %> <br>
getRealPath() : <%= application.getRealPath("/1.jsp") %> <br>

<%= application.log("2019-6-20 by Kang") %>

</body>
</html>