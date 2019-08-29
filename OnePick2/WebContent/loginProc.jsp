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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@ include file="css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>로그인</title>
<style>
	* {
		margin: 0 auto;
		font-family: 'Nanum Gothic', sans-serif;
	}
	#login_form  { 
		display: block;
		font-size: 20pt;
		left: 300px;
		line-height: 50px;
		width: 300px;
		padding: 30px;
	}
	.form-group {
		font-size: 15pt;
	}
	#form-div {
		border-radius: 5px;
		
	}
	#form-control {
		width: 50px;
	}
	input{
		width:200px;
		height: 50px;
	}
	.btnLogin {
		background-color: #0080FF !important;
	}
</style>
</head>

<body>

<form id="login_form" name="form1" method="post" action="main.jsp">
<label id="login_label">로그인</label>
	<div id="form-div">
	  <div class="form-group">
	    아이디<input type="text" class="form-control short" id="userId" placeholder="Id" maxlength="20">
	  </div>
	  <div class="form-group">
	    비밀번호<input type="password" class="form-control short" id="userPw" placeholder="Password" maxlength="20">
	  </div>
	  <button type="submit" class="btn btn-primary">로그인</button>
 	</div>
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
		$("btnLogin").onclick(function() {
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
					application.setAttribute("id", id); 
					application.setAttribute("pw", pw);
					application.setAttribute("nick", nickname);
				%>
				
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
    <%}else{ %>
        연결에 실패하였습니다.(loginProc)
    <%}
%>


</body>
</html>