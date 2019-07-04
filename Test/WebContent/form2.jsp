<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action = "proc.jsp" method="post">
		이름 : <input type = "text" name = "name"><br>
		첫번째 ID값 : <input type = "number" max= "1000" name = "id1"><br>
		두번째 ID값 : <input type = "number" max= "1000" name = "id2"><br>
		세번째 ID값 : <input type = "number" max= "1000" name = "id3"><br>
		
		<input type = "submit" value = "만능키 값 구하기">
	</form>
</form>
</body>
</html>