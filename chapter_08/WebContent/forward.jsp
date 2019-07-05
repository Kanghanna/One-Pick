<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
forward.jsp 입니다.<br>

<%
	String id = request.getParameter("id");
	String hobby = request.getParameter("hobby");
	String school = request.getParameter("school");
%>

<b><%= id %></b>님의 취미는 <%= hobby %> 입니다. <br>
당신은 <%=school %> 학생 입니다.
</body>
</html>