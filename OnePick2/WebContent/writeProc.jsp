<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>

<%
	String nick = (String) application.getAttribute("nick");
%>

<center><p>글 작성</p>
<table>
	<tr>
		<td><input type="radio" id="nickName" readOnly value=<%=nick %>>닉네임</td>
		<td><input type="text" id="name" name="name" value="닉네임을 입력하세요" size="10">
			&nbsp;&nbsp;<input type="radio" id="noName">익명
		</td>
	<tr>
		<td>제목</td>
		<td><input type = "text" name = "title" size = "20"></td>
	</tr>
	<tr>
		<td colspan=2>
			<textarea rows="10" cols="40"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<input id="submit" type="submit" action = ".jsp" value="글작성">
		</td>
	</tr>

</table>
</center>


<script>
	$("#submit").onclick("")
</script>

</body>
</html>