<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
* {
	font-family: "돋움", Dotum, notokr-regular !important;
}

#title {
	font-size: 20pt;
	border-bottom: 3px solid #3592ff;
	padding: 20px 0;
}

#desc {
	padding: 20px 0;
}
#img {
	align : center;
	width : 100%;
}
</style>
</head>
<body>
<%
	String src = application.getRealPath("/WEB-INF/commu_image/김민규.jpg");
%>
<div id = "title">김민규.com</div>
<div id = "desc">김민규 연습생의 개인 커뮤니티 공간입니다.</div>
<img src = <%=src%>>
</body>
</html>