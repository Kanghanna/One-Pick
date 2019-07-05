<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
6/20<hr>
<body>
id : <%= config.getInitParameter("id") %>
pw : <%= config.getInitParameter("pw") %>
name : <%= config.getInitParameter("name") %>

<hr>

getServletName() : <%= config.getServletName() %> <br>

<%

	Enumeration en = config.getInitParameterNames();
	
	while(en.hasMoreElements()) {
		
		String initKey = (String)en.nextElement();
		String initValue = (String) config.getInitParameter(initKey);
		out.println(initKey + " : " + initValue);
	}
	
	Exception ex = new Exception();
	ex.printStackTrace();

%>
</body>
</html>