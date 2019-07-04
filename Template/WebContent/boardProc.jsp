<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>게시판</center>
	<table>
		<tr>
			<td>제목</td>
			<td><input type = "text" name = "title" size = "20"></td>
		</tr>
		<tr>
			<td colspan = "2">
				<textarea rows = "10" cols = "40"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "right">
				<input type = "submit" value = "글 작성">
			</td>
	</table>
</body>
</html>