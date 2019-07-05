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
String id = request.getParameter("id");

	if(id.equals("choi"))
		response.sendRedirect("index.jsp?name=" + id); //out.println("회원");
	else
		response.sendRedirect("join.jsp"); //out.println("비회원");
%>

</body>
</html>