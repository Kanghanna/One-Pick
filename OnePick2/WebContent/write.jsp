<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
<center><p>글 작성</p>
<table>
	<tr>
		<td><input type = "radio" id = "wName">닉네임</td>
		<td><input type = "text" id = "name" name = "name" value = "닉네임을 입력하세요" size = "10">
			&nbsp;&nbsp;<input type = "radio" id = "noName">익명
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
			<input type="submit" action = "guess.jsp" value="글작성">
		</td>
	</tr>

</table>
</center>

</body>
</html>