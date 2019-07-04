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
<img src = "image/image05.jpg" width = "400" height = "250">
<br>
<%
	BufferedReader reader = null;
	
	//파일 , DB, 인터넷 처리할 때는 반드시 try catch문 사용하여 예외처리
	try {
		String filePath = application.getRealPath("/WEB-INF/little.txt"); //논리적인 경로를 물리적인 경로로 바꿔줌
		//out.println(filePath);
		reader = new BufferedReader(new FileReader(filePath));
		while(true) {
			String str = reader.readLine();
			if(str == null) break;
			out.println(str + "<br>");
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		reader.close();
	}
%>
</body>
</html>