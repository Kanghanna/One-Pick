<%@page import="java.sql.PreparedStatement"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron">
  <h1 class="display-4">OnePick 회원가입을 완료했습니다!</h1>
  <p class="lead">OnePick 커뮤니티에서 게시글을 올리고 사람들과 소통해보세요 *_*</p>
  <hr class="my-4">
  <p>커뮤니티 활동을 위해 로그인 하기</p>
  <a class="btn btn-primary btn-lg" href="#" role="button">로그인</a>
</div>
	
<%
		
request.setCharacterEncoding("UTF-8");	
		
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String nickname = request.getParameter("nickname");


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:XE";
String query = "INSERT INTO LOGIN_ACCOUNT VALUES(?, ?, ?)";
Boolean connect = false;
	
try{
    Class.forName(driver);
    conn=DriverManager.getConnection(url,"PRODUCE_DB","3101"); //자신의 아이디와 비밀번호
    connect = true;
    
    pstmt = conn.prepareStatement(query);
    
    pstmt.setString(1, id);
    pstmt.setString(2, pw);
    pstmt.setString(3, nickname);
   
    
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
	
	if (pstmt != null) {
		try { 
			pstmt.close(); 
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
    연결에 실패하였습니다.
<%}
%>
</body>
</html>