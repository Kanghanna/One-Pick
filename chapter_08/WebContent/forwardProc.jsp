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
%>

현재 페이지는 forwardProc.jsp 입니다. <br>
forward 이전입니다. <br>

<jsp:forward page = "forward.jsp">
	<jsp:param name = "school" value = "Mirim"/>
</jsp:forward>

현재 페이지는 forwardProc.jsp 입니다. <br>
forward 이후입니다. <br>

</body>
</html>