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
</style>
</head>
<body>
	<%
	String contentPage = request.getParameter("CONTENTPAGE");
	//String uri = request.getRequestURI().toString(); 
	//String pageName = uri.substring(uri.lastIndexOf("/") + 1, uri.length());
	//out.println(pageName);
	
	%>

	<center>
		<table width="1500" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="2">
					<jsp:include page="top.jsp" />
				</td>
			</tr>

			<tr>
				<td colspan="2" width="900" valign="top">
					<jsp:include page=<%=contentPage%> />
				</td>
			</tr>
			<tr>
				<td width="900" valign = "bottom" colspan="2">
					<jsp:include page="bottom.jsp" />
				</td>
			</tr>
		</table>
	</center>

</body>
</html>