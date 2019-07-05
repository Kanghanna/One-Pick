<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
6/21<hr>

	<%
		request.setCharacterEncoding("utf-8");
	%>

	<b>request.getParameter() 메서드</b>
	<br> 이름 :
	<%=request.getParameter("name")%>
	<br> 주소 :
	<%=request.getParameter("address")%>
	<br>
	<br>

	<b>request.getParameterValues() 메서드 사용</b>
	<br>
	<%
		String values[] = request.getParameterValues("pet");

		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				out.println(values[i] + "<br>");
			}
		}
	%>
	
	<br>
	
	<b>request.getParameterNames() 메서드 사용</b>
	<%
		Enumeration en = request.getParameterNames();
	
		while(en.hasMoreElements()) {
			String key = (String) en.nextElement();
			out.println(key + "<br>");
		}
	%>
	
	<br>
	
	<b>request.getParameterMap() 메서드 사용</b>
	<br>
	<%
		Map map = request.getParameterMap();
		String namemap[] = (String[]) map.get("name");
		String addressmap[] = (String[]) map.get("address");
		out.println(namemap[0] + " : " + addressmap[0] + "<br>");
		
		String petmap[] = (String[]) map.get("pet");
		if(petmap != null) {
			for(int i = 0; i < petmap.length; i++) {
				out.println(petmap[i] + "<br>");
			}
		}
	%>
	
	<br>
	
	<b>헤더 목록 출력 (기본적으로 제공 되는 값)</b>
	<%
		Enumeration en2 = request.getHeaderNames();
	
		while(en2.hasMoreElements()) {
			
			String headerKey = (String) en2.nextElement();
			String headerValue = request.getHeader(headerKey);
			out.println(headerKey + "<br>");
		}
	%>
</body>
</html>