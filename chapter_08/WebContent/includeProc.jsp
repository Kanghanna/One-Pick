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
	String name = request.getParameter("name");
	String pageName = request.getParameter("pageName");
	
	pageName += ".jsp";
%>

includeProc.jsp 상단 입니다.
<hr>

<!--<%@ include file = "include.jsp" %>-->
<jsp:include page="<%= pageName %>" flush = "false">
	<jsp:param name = "age" value = "23">
</jsp:include>

<hr>
includeProc.jsp 하단 입니다.
</body>
</html>