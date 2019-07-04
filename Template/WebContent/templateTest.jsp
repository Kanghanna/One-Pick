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
	String contentPage = request.getParameter("CONTENTPAGE");
%>

<table width="800" border="1" cellpadding="2" cellspacing="0">
<tr>
	<td colspan="2">
		<jsp:include page="top.jsp"/>
	</td>
</tr>

<tr>
	<td width="200" valign="top">
		<jsp:include page="left.jsp"/>
	</td>
	<td width="600" valign="top">
		<jsp:include page="<%=contentPage%>"/>
	</td>
</tr>

<tr>
	<td colspan="2">
		<jsp:include page="bottom.jsp"/>
	</td>
</tr>
</table>

</body>
</html>