<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@ include file="css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>OnePick 김요한 커뮤니티</title>
<style>
	#title {
		font-size: 20pt;
		border-bottom: 3px solid #3592ff;
		padding: 20px 0;
	}
	
	#desc {
		padding: 20px 0;
	}
	#img-banner {
		position: relative;
		left: 300px;
	}
	#list {
		margin : 0 auto;
		border-bottom : 1px solid #3592ff;
	}
	#cap {
		font-size: 20pt;
		font-family: 'BEBAS';
	}
</style>
</head>


<body>
<%

request.setCharacterEncoding("UTF-8");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:XE";

Boolean connect = false;

String bno;
int board_count;
String nickname;
String name;
String title;
int view_cnt;
String date;
String rq_name = request.getAttribute("rq_name");
try{
    Class.forName(driver);
    conn=DriverManager.getConnection(url,"PRODUCE_DB","3101"); //자신의 아이디와 비밀번호
    connect = true;
    
    
    stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT num, id, nickname, name, title, view_cnt, TO_CHAR(upload_date, 'YYYY-MM-DD') FROM COMMU_BOARD WHERE name=" + rq_name);
    
	
    %>
    <div id = "title">김요한.com</div>
    <div id = "desc">김요한 연습생의 개인 커뮤니티</div>
    <img id = "img-banner">
    	
    	<!-- 로그인 했을 때만 글쓰기 버튼 보이기 -->
    	<c:if test="${session.getAttribute('id') != null}">
    		<a href="write.jsp"><input id="btnWrite" type="button" value="글쓰기"></a>
    	</c:if>


    <%--<%=board_count%>개의 게시물--%>


    <!-- 게시판 목록 -->
    <table id="list" width="700px">
    	<tr>
    		<th>글번호</th>
    		<th>엑스원</th>
    		<th>글 제목</th>
    		<th>글쓴이</th>
    		<th>작성일</th>
    		<th>조회수</th>
    	</tr>
    
    <%
    while(rs.next()) {
    	
    	bno = rs.getString("num");
    	//board_count = rs.getInt("3");
    	nickname = rs.getString("nickname");
    	name = rs.getString("name");
    	title = rs.getString("title");
    	view_cnt = rs.getInt("view_cnt");
    	date = rs.getString("7");
    	
    	String src = "img/commu_image/" + name + ".jpg"; //사진 파일 경로
        	

    	%>
    	 <script>
    		$("#img-banner").attr("src", <%=src%>);
    	</script>
	
	<%
		//for(int i=0; i < board_count; i++){
		
	%>
	<tr>
		<td><%=bno %></td>
		<td><%=name %></td>
		<td>
			<a href="view_board.jsp?bno=<%=bno%>"><%=title %></a>
		</td>
		<td><%=nickname %></td>
		<td><%=view_cnt %></td>
		<td><%=date %></td>
	</tr>
	<%
		//}
	%>
	

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
        연결에 실패하였습니다.
    <%}
%>

</table>
</body>
</html>