<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
홀수 출력 :
<% 
	for(int i = 1; i <= 10; i++) {
		if(i%2 == 1)
			out.println(i + " ");
	}

%>
<br>

<%= "액션 태그 역할 : 각 페이지 간에 이동 또는 사용 등에 활용" %>
<br>
<%= "액션 태그 종류 : include, forward, plug-in, useBean, setProperty, getProperty" %>
<br>


</body>
</html>