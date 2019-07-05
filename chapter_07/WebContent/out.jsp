<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    autoFlush="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
6/20<hr>

isAutoFlush() : <%= out.isAutoFlush() %> <br>
getBufferSize() : <%= out.getBufferSize() %> <br>
getRemaining() : <%= out.getRemaining() %> <br>

<% out.flush(); %> 
<% out.clearBuffer(); %>

<hr>

<%
	//JspWriter out2 = new JspWriter();
	JspWriter choi = pageContext.getOut(); //out 내장 객체를 리턴
%>

<% out.println("하이"); %><br>
<% choi.println("최 ~ choi~"); %> <br>

<hr>

<%
	//HttpServletReqeust request2 = new HttpServletRequest();  이렇게는 request객체의 또다른 변수를 만들지 못함
	ServletRequest kim = pageContext.getRequest();
	
	String id = request.getParameter("id");
	String id2 = kim.getParameter("id"); //pageContext를 이용하여 가져온 reqeust객체의 또 다른 변수 사용
%>

<hr>
application 객체로 프로젝트 안에서 공유되는 정보 <br>
getServerInfo() : <%= application.getServerInfo() %> <br>
</body>
</html>