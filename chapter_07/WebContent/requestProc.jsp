<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
6/14<hr>
<%
	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	String subject = request.getParameter("subject");
	
	Enumeration en = request.getParameterNames();
	
%>

학번 : <%= num %> <br>
이름 : <%= name %> <br>
학년 : <%= grade %> <br>
과목 : <%= subject %> <br>

<hr>
<%

	while(en.hasMoreElements()){ //hasMoreElements() : boolean 형, key값이 있으면 true, 아니면 false
		String key = (String) en.nextElement(); //nextElement() : Object형 , 다음 key 값을 가져옴
		String value = request.getParameter(key);
		out.println(key + " : " + value);
	}
%>

<hr>
<%
	request.setAttribute("일", "1");
	request.setAttribute("이", "2");
	request.setAttribute("삼", "3");
%>

<%= request.getAttribute("일") %>

<br>
<%
	Enumeration en1 = request.getAttributeNames();

	while(en1.hasMoreElements()) {
		
		String key = (String) en1.nextElement();
		String value = (String) request.getAttribute(key);
		out.println(key + " : " + value + "<br>");
	}
%>
</body>
</html>