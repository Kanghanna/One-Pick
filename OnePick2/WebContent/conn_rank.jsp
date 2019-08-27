<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String arr[];

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
    
    rs = stmt.executeQuery("SELECT name, company FROM PRODUCE_INFO");
    
    while(rs.next()) {
    	arr[0] = rs.getString("name");
    	arr[1] = rs.getString("company");
    	
    	request.setAttribute("arr", arr);
    	
    	
    }
    
    
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
%>
<%
if(connect==true){%>
    연결되었습니다.
<%}else{ %>
    연결에 실패하였습니다.
<%}

%> 
