<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check() {
		if(document.mem.id.value == "") {
			alert("ID를 입력해주세요...");
			document.mem.id.focus();
			return;
		}
		
		if(document.mem.pw.value == "") {
			alert("PW를 입력해주세요...");
			document.mem.pw.focus();
			return;
		}
		
		if(document.mem.name.value == "") {
			alert("이름을 입력해주세요...");
			document.mem.name.focus();
			return;
		}
		
		document.mem.submit();
	}

</script>
</head>
<body>
6/21<hr>

<pre>
	*JSP 에서 기본으로 제공되는 내장객체는 9개
	-request, response, out : 입출력과 관련
	-session, application, pageContext : 현재 실행되는 페이지의 외부환경 정보와 관련
	-page : jsp 페이지 그 자체를 의미
	-config : 서블릿을 초기화 하는 동안 참조할 정보를 전해주는 역할
	-exception : 예외 객체
</pre>

<hr>
<b>내장 객체 중 request, response 연습</b>
<br>
<form name = "mem" method = "post" action = "memberProc.jsp">
아이디 : <input type = "text" name = "id" size = "10"> <br>
비밀번호 : <input type = "text" name = "pw" size = "10"> <br>
이름 : <input type = "text" name = "name" size = "10"> <br>
직업 :
<select name = "job">
	<option value = "학생">학생</option>
	<option value = "교사">교사</option>
	<option value = "기타">기타</option>
</select>
<br>
<input type = "button" value = "등록" onclick = "check()">
<input type = "reset" value = "취소">

</body>
</html>