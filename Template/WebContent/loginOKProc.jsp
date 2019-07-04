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
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");

%>

[로그인 성공]<br>

[메뉴1] | [메뉴2] | ...... <br>

<font color = "yellowGreen" size = 5>
<b><%= id %></b>
</font>
</body>
</html>