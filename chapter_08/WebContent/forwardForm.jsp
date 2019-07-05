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
	String pageName = "forwardProc.jsp";
%>
	<form method = "post" action = "<%= pageName %>">
		아이디 : <input type = "text" name = "id"> <br>
		취미 :
		<select name = "hobby">
			<option value = "WOW">WOW</option>
			<option value = "만화보기">만화보기</option>
			<option value = "영화보기">영화보기</option>
		</select>
		<input type = "submit" value = "입력 완료">
	</form>

</body>
</html>