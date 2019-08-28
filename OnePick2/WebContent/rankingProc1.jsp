<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="css.jsp" %>
<title>One-Pic 1주차 순위</title>

<style>

* {
	margin: 0;
	padding: 0;
}

#title {
	padding: 15px;
	font-size: 25pt;
	border-bottom: 3px solid #3592ff;
}

#desc {
	padding: 15px;
	font-size: 17pt;
}

/*
rect( <top>, <right>, <bottom>, <left> )
<top> : 위를 기준으로 시작하는 위치
<right> : 왼쪽을 기준으로 끝나는 위치
<bottom> : 위를 기준으로 끝나는 위치
<left> : 왼쪽을 기준으로 시작하는 위치
*/
div[id^="tag-"] img {
	position: absolute; /*절대 위치*/
	top : 120px;
	left : 720px;
	clip: rect(0, 50px, 50px, 0);
}

/* top bottom 빼고 모두 변경*/
#tag-2 img {
	top : 300px;
	left : 580px;
	clip: rect(60px, 25px, 90px, 0);
}

#tag-3 img {
	top : 300px;
	left : 900px;
	clip: rect(60px, 65px, 90px, 40px);
}

#tag-4 img {
	top : 460px;
	left : 320px;
	clip: rect(60px, 105px, 90px, 80px);
}

#tag-5 img {
	top : 460px;
	left : 610px;
	clip: rect(60px, 145px, 90px, 120px);
	
}

#tag-6 img {
	top : 460px;
	left : 950px;
	clip: rect(60px, 185px, 90px, 160px);
}

#tag-7 img {
	top : 650px;
	left : 20px;
	clip: rect(60px, 225px, 90px, 200px);
}

#tag-8 img {
	top : 650px;
	left : 340px;
	clip: rect(60px, 265px, 90px, 240px);
}

#tag-9 img {
	top : 650px;
	left : 670px;
	clip: rect(60px, 305px, 90px, 280px);
}

#tag-10 img {
	top : 650px;
	left : 960px;
	clip: rect(60px, 345px, 90px, 320px);
}

#1st img {
	position: absolute;
	margin: 0 auto;
	width: 250px;
	height: 250px;
}
#2-10 {
	
}

#company { font-size: 15px; }

#photo {
	positon: absolute;
	width: 150px;
	height: 150px;
	top: 0;
	left: 0;
}

#2 #photo {
	positon: absolute;
	top : 300px;
	left : 580px;
}

#3 #photo {
	positon: absolute;
	top: 300px;
	left: 600px;
}

#11-101 {
	position: relative;
	display : inline;
	border-bottom : 2px solid #3592ff;
}

div[id $= "th"] img {
	position: absolute;
	margin : 0 60px;
	clip: rect(0, 640px, 35px, 0);
}
/*
#11-30th img {
	clip: rect(0, 640px, 35px, 0);
}*/

#31-50th img {
position: absolute;
margin : 20px;
	clip: rect(50px, 640px, 85px, 0);
}

#51-70th img {
position: absolute;
	clip: rect(90px, 640px, 125px, 0);
}

#71-90th img {
position: absolute;
	clip: rect(0, 640px, 35px, 0);
}

#91-101th img {
position: absolute;
	clip: rect(0, 640px, 35px, 0);
}

#mask_base {
	position: absolute;
	width: 200px;
	height: 200px;
	top: 0;
	left: 0;
	background-color: white;
	clip: rect(0, 0, 65px, 65px);
}

#rank_num {
	color: #3592ff;
	font-size: 17pt;
}

#rank_num b {
	color: black;
}

#info {
	display: inline;
	text-align: center;
	vertical-align: 100px;
}
#info1 {
display : block;
position : absolute;
font-size : 17pt;
margin : 0 auto;
}

.menu {
	width: 500px;
	height: 500px;
	position: relative;
	top: 0;
	left: -100px;
}

.menu img {
	position: absolute; /*절대 위치*/
	clip: rect(0, 299px, 29px, 193px);
}
</style>
</head>
<body>

<div id="all">
		<div id="title">1주차</div>
		<div id="desc">
			◆ 연습생 순위는 <b>온라인 투표 및 녹화현장 점수</b>를 합산한 결과입니다.
		</div>

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
    
    rs = stmt.executeQuery("SELECT num, name, company, one_week FROM PRODUCE_INFO ORDER BY one_week");
    
    while(rs.next()) {
    	String num;
    	String name;
    	String company;
    	String one_week;
    	
    	num = rs.getString("num");
    	name = rs.getString("name");
    	company = rs.getString("company");   
    	one_week = rs.getString("one_week");

			int cnt = 0;
			int wh_cnt = 0;
			
					cnt++;
					
					//String[] arr = str.split("-"); //arr[0] = 순위 / arr[1] = 연습생 이름
							
					String src = "img/practice_people/" + name + ".jpg"; //사진 파일 경로
					String tag_file = application.getRealPath("WEB-INF/img/logo/tag_ranking.png"); //1~10등까지 이미지
					String clip_mask = application.getRealPath("WEB-INF/img/logo/rank_mask65.png"); //클리핑 마스크
					String r_title = application.getRealPath("WEB-INF/img/logo/r_title.png"); //등수 자르는 타이틀
					String tag_src = "tag-" + cnt;
					
					if (Integer.parseInt(one_week) == 1) { // WEB-INF/img/practice_people/김민규 tag-1
		%>
		
		<center>
			<div id=<%=tag_src%>>
				<img src=<%=tag_file%>>
			</div>
			<div id="1st">
				<img id="mask_base" src=<%=clip_mask%>><a href="produce_info.jsp?num=<%=num %>"><img id="photo" src=<%=src %>></a>
				<div id="info1">
					<b><%=name%></b>
					<p id ="company"><%=company%></p>
				</div><br>
			</div>
		</center>
		<%
			} else if (Integer.parseInt(one_week) <= 10) { //2~10등까지
		%>
		<div id="2-10">
			<div id=<%=tag_src%>>
				<img src=<%=tag_file%>>
			</div>
			<div id=<%=one_week%>>
				<img id="mask_base" src=<%=clip_mask%>> 
				<a href="produce_info.jsp?num=<%=num %>">
					<img id="photo" src=<%=src%>>
				</a>
				<div id="info1">
					<b><%=name %></b><br>
					<p id ="company"><%=company%></p>
				</div><br>
			</div>
		</div>
		<%
			} else {
		%>
		<%
			if (Integer.parseInt(one_week) >= 11 && Integer.parseInt(one_week) % 2 == 0) {

				if (Integer.parseInt(one_week) == 48) { //울림 김민서 일 때
					src = application.getRealPath("WEB-INF/img/practice_people/" + name + "2.jpg");
				}
		%>
				<div id="11-101" width = "45%" float = "left" display = "inline">
					<img id="mask_base" src=<%=clip_mask%> width="100px" height="100px">
					<a href="produce_info.jsp?num=<%=num %>">
						<img id="photo" src=<%=src%> width="100px" height="100px">
					</a>
					<div id="info">
						<b id="rank_num"><%=one_week%></b>&nbsp;&nbsp;&nbsp;<b><%=name%></b>
					</div>
				</div>
			<%
				} else if (Integer.parseInt(one_week) % 2 != 0) {
			%>
					<div id="11-101" width = "45%" float = "right" display = "inline">
						<img id="mask_base" src=<%=clip_mask%> width="100px" height="100px"> 
						<a href="produce_info.jsp?num=<%=num %>">
							<img id="photo" src=<%=src%> width="100px" height="100px">
						</a>
						<div id="info">
							<p id="rank_num"><%=one_week%>&nbsp;&nbsp;&nbsp;<b><%=name%></b></p>
							<p id="company"><%=company %></p>
						</div>
					</div>
				<%
					}

					}

					if (Integer.parseInt(one_week) == 10) {
				%>
				<div id="11-30th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else if (Integer.parseInt(one_week) == 30) {
				%>
				<div id="31-50th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else if (Integer.parseInt(one_week) == 50) {
				%>
				<div id="51-70th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else if (Integer.parseInt(one_week) == 70) {
				%>
				<div id="71-90th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else if (Integer.parseInt(one_week) == 90) {
				%>
				<div id="91-101th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else { //퇴출한 연습생

					}
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
%>
<%
if(connect==true){%>
    연결되었습니다.
<%}else{ %>
    연결에 실패하였습니다.
<%}

%> 
	</div>
</body>
</html>