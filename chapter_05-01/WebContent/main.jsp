<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "top.jsp" %>
<!--<jsp:include page = "top.jsp" />-->
<hr>
<h1>main.jsp</h1>

<i><b>include file 지시어 : 여러 jsp 파일에서 공통으로 사용되는 부분을 별도로 만들어 필요할 때 불러다 쓴다.</b></i>
<br>
<b>================ 액션 태그를 이용한 include ================</b>
<br>
<font color = "blue" size = 4>
<jsp:include page="intag.jsp" />
</font>
<br>
<!-- name = key 값 -->
<jsp:include page= "intag1.jsp">
	<jsp:param name = "nation" value ="Korea"/>
</jsp:include>
<br>
<b>================ jsp 디렉티브를 이용한 include ================</b>

<%@ include file="bottom.jsp"%>
</body>
</html>