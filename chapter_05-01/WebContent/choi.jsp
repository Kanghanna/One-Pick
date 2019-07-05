<%@ page 
	language="java" 
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.setStatus(200); //정상적인 코드니까 익스플로러 자체의 에러 페이지 띄우지 말아달라는 의미
%>
이런 ! 에러가 발생했군요 ...<br>
최대한 빠르게 복구하겠습니다...

<b>예외 타입 : </b> <%= exception.getClass().getName() %>
<br>
<b>예외 메세지 : </b> <%= exception.getMessage() %>

<%

	//isErrorPage="true" 이면 기본적으로 exception 객체를 만들 수 있게 해준다, false 이면 만들 수 없다.
	exception.printStackTrace();
%>
</body>
</html>