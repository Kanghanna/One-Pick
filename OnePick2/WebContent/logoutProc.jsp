<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnePick 로그아웃</title>
</head>
<body>
<div class="jumbotron">
  <h1 class="display-4">OnePick 로그아웃</h1>
  <p class="lead">다음에 또 방문해주세요! *_*</p>
</div>

<% 
	application.removeAttribute("id");
	application.removeAttribute("pw");
	application.removeAttribute("nick");
	%>
</body>
</html>