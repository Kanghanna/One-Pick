<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#title {
		border-bottom : 3px solid gray;
	}
	b {
		color : #33;
	}
	#no1 {
		
	}
	#no2 {
		
	}
	#no3 {
		
	}
	#no4 {
		
	}
	#no5 {
		
	}
	#no6 {
		
	}
	#no7 {
		
	}
	#no8 {
		
	}
	#no9 {
		
	}
	#no10 {
		
	}
	#no11 {
		
	}
</style>
</head>
<body>
<%
	String event = application.getRealPath("WEB-INF/logo/event.png");
%>

<div id = "title">이벤트</div>
<div id = "desc">
	100% 당첨! 문제 풀고,
	<img src = "" value = "새콤달콤">과 <b>연습생 후원금</b> 받아가세요!<br>
	받은 후원금은 바로 후원할 수 있습니다!
</div>
<div id = "exam">
	<image src = <%= event %> width="100%" height="1000px">
	정답 : <input id = "no1" type = "">
	정답 : <input id = "no2" type = "num">
	정답 : <input id = "no3" type = "num">
	정답 : <input id = "no4" type = "num">
	정답 : <input id = "no5" type = "num">
	정답 : <input id = "no6" type = "num">
	정답 : <input id = "no7" type = "num">
	정답 : <input id = "no8" type = "num">
	정답 : <input id = "no9" type = "num">
	정답 : <input id = "no10" type = "num">
	정답 : <input id = "no11" type = "num">
</div>

</body>
</html>