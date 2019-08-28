<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@ include file="css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>로그인</title>
<style>
	* {
		margin: 0 auto;
	}
	div  { 
		display: block;
		font-family: 'BEBAS';
		font-size: 40pt;
		left: 300px;
		position: absolute;
	}
	div p {
		font-family: 'BEBAS';
		font-size: 40pt;
	}
	form { line-height: 50px; }
	input{
		width:200px;
		height: 50px;
	}
	#btn btn-Login {
		background-color: #0080FF;
	}
</style>
</head>

<body>

<form name="form1" action="main.jsp">
	<div><p>Login</p></div>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input name="userId" id="userId"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="userPw" id="userPw"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" id="btn btn-Login">로그인</button>
			</td>
		</tr>
	</table>
</form>

<%

request.setCharacterEncoding("UTF-8");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
Boolean connect = false;
	
try{
    Class.forName(driver);
    conn=DriverManager.getConnection(url,"PRODUCE_DB","3101"); //자신의 아이디와 비밀번호
    connect = true;
    
    stmt = conn.createStatement();
    
    rs = stmt.executeQuery("SELECT * FROM LOGIN_ACCOUNT");
    
    while(rs.next()) {
    	
    	String id = rs.getString("id");
    	String pw = rs.getString("pw");
    	String nickname = rs.getString("nickname");
    	
    	%>
    	
<script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			
			if(userId == ""){
				alert("아이디를 입력하세요");
				$("#userId").focus();
				return;
			}
			if(userPw == ""){
				alert("비밀번호를 입력하세요");
				$("#userPw").focus();
				return;
			}
			if(userId == id && userPw == pw){
				<%
					session.setAttribute("id", id); 
					session.setAttribute("pw", pw);
					session.setAttribute("nick", nickname);
				%>
				alert("로그인 되었습니다.");
			}
			
			document.form1.action = "main.jsp";
			document.form1.submit();
			
			
		});
		
	});
</script>
    	
    	<%
    	
    } //while
    
    
    }catch(Exception e){
        connect = false;
        e.printStackTrace();
    } finally {
    	if (rs != null) { 
    		try { 
    			rs.close(); 
    		} catch (SQLException e) {
    			e.printStackTrace(); 
    		} 
    	} 
    	
    	if (stmt != null) {
    		try { 
    			stmt.close(); 
    		} catch (SQLException e) {
    			e.printStackTrace(); 
    			} 
    	} 
    	
    	if (conn != null) {
    		try { 
    			conn.close(); 
    		} catch (SQLException e) {
    			e.printStackTrace(); 
    		} 
    	}
    }

    if(connect==true){%>
        연결되었습니다.
    <%}else{ %>
        연결에 실패하였습니다.
    <%}
%>


</body>
</html>