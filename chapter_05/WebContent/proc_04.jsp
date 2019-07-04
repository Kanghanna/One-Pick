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
	String localNum = request.getParameter("localNum");
	String local = "";
	
	switch(localNum){
	case "0" :
		local = "종로";
	break;
	case "1" :
		local = "도봉";
		break;
	case "2" :
		local = "동대문";
		break;
	case "3" :
		local = "강북";
		break;
	case "4" :
		local = "서초";
		break;
	case "5" :
		local = "동작";
		break;
	case "6" :
		local = "강서";
		break;
	case "7" :
		local = "은평";
		break;
	}
	
	out.print("선택하신 지역은 <b>" + local + "</b> 입니다.");
%>
</body>
</html>