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
	request.setCharacterEncoding("UTF-8");	
	int num = Integer.parseInt(request.getParameter("number"));
	
	if(num <= 10) {
		//out.println("입력 받은 숫자는 " + num + " 입니다.");
	%>
	 	입력 받은 숫자는 <%=num%> 입니다.
<%	}
%>
</body>
</html>