<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
<center><p>�� �ۼ�</p>
<table>
	<tr>
		<td><input type = "radio" id = "wName">�г���</td>
		<td><input type = "text" id = "name" name = "name" value = "�г����� �Է��ϼ���" size = "10">
			&nbsp;&nbsp;<input type = "radio" id = "noName">�͸�
		</td>
	<tr>
		<td>����</td>
		<td><input type = "text" name = "title" size = "20"></td>
	</tr>
	<tr>
		<td colspan=2>
			<textarea rows="10" cols="40"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<input type="submit" action = "guess.jsp" value="���ۼ�">
		</td>
	</tr>

</table>
</center>

</body>
</html>