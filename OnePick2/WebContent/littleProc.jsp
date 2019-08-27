<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="image/image05.jpg" width="400" height="250">
<br>
<%
	BufferedReader reader = null;

	try {
		String filePath = application.getRealPath("/WEB-INF/little.txt");
		//out.println(filePath);
		reader = new BufferedReader(new FileReader(filePath));
		while(true) {
			String str = reader.readLine();
			if(str==null) break;
			out.println(str + "<br>");
		}		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		reader.close();
	}
%>
</body>
</html>



















