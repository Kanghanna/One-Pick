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
<form method = "post" action = "requestProc.jsp">
	학번 : <input type = "text" name = "num"> <br>
	이름 : <input type = "text" name = "name"> <br>
	학년 : 
		<input type = "radio" name = "grade" value = "1">1학년 
		<input type = "radio" name = "grade" value = "2">2학년 
		<input type = "radio" name = "grade" value = "3" checked = "checked">3학년 
		<input type = "radio" name = "grade" value = "4">4학년 
	<br>
	
	과목 : <select name = "subject">
		<option value = "java">JAVA</option>
		<option value = "jsp">JSP</option>
		<option value = "xml">XML</option>
	</select>
	<br>
	
	<input type = "submit" value = "입력 완료">
</form>


<hr>

<%
%>
</body>
</html>