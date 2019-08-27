<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#week {
	border: 2px solid #3592ff;
}

#week li {
	list-style : none;
	height: 30px;
	padding : 20px;
	border-bottom: 2px solid #3592ff;
}

#week li a {
	text-decoration: none;
	color : black;
	
}

#week li : nth-child (3) {
	border-bottom: none;
}
</style>
</head>
<body>
	<%
		
	%>

	<table id="week" width="300" height="600">
		<tr>
			<td>
				<ul>
					<li><a href = "ranking1.jsp">1주차</a></li>
					<li><a href = "ranking2.jsp">2주차</a></li>
					<li><a href = "ranking3.jsp">3주차</a></li>
				</ul>
			</td>
		</tr>
	</table>

</body>