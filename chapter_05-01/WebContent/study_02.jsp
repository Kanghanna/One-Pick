<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "java.sql.*"
    session = "true"
	buffer = "8kb"
	autoFlush = "true"
	isThreadSafe = "true"
	info="2019-6-13 update by kang"
	errorPage="choi.jsp"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 기본으로 제공해주는 패키지
	import java.lang.*;
	import javax.servlet.*;
	import javax.servlet.jsp.*;
	import javax.servlet.http.*;

 --%>
 
 <b>페이지 지시어(= 디렉티브) JSP 문서의 앞에서 꼭 필요한 것만 기술한다.</b>
 <br>
 <%
 	Calendar date = Calendar.getInstance();
 	int year = date.get(Calendar.YEAR);
 	int month = date.get(Calendar.MONTH) + 1;
 	int day = date.get(Calendar.DATE);
 	out.println("오늘은 " + year + "년 " + month + "월 " + day + "일 입니다.");
 %>
 <br>
 <%= getServletInfo() %>
 <br>
 <hr>

</body>
</html>