<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
}
#tb-template {
	margin : 0 auto;
}
</style>
</head>
<body>
	<%
	String contentPage = request.getParameter("CONTENTPAGE");
	//String uri = request.getRequestURI().toString(); 
	//String pageName = uri.substring(uri.lastIndexOf("/") + 1, uri.length());
	//out.println(pageName);
	out.print(contentPage);
	%>

		<table id="tb-template" width="1500">
			<tr>
				<td>
					<jsp:include page="top.jsp"/>
				</td>
			</tr>
			<tr>
				<td width="900" valign="top">
					<jsp:include page=<%=contentPage%>/>
				</td>
			</tr>
			<tr>
				<td width="900" valign = "bottom">
					<jsp:include page="bottom.jsp"/>
				</td>
			</tr>
		</table>
</body>
</html>