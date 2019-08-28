<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>One-Pick 연습생 상세 정보</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<style>
	* {
		margin: 0;
		padding: 0;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	#corner {
		border : 10px solid #0080FF;
		padding : 0, 0, 0, 20px;
	}
	
	#company_info {
		padding : 20px;
		border-bottom: 1px solid #BDBDBD;
		font-size : 20px;
	}
	
	#produce_img { display: block; }
	#name_info {
		padding: 8px;
		font-size: 23px;
		font-weight: bold;
	}
	#produce_info { 
		font-size: 12pt;
		border-top: 1px solid #BDBDBD;
	}
	#produce_info > tr { padding-bottom : 0, 20px; } /*안 먹음 ㅠㅠ*/
	
	td:first-child { /*table*/
		color: gray;
		width: 150px;
	}
	
	#one_word {
		border: 1px solid #BDBDBD;
		background-color: #E6E6E6;
		padding : 15px;
		margin : 10px;
	}
	#one_word b {
	 	color: blue;
	 	font-size : 14pt;
	 }
	#chart_div {
		padding: 0;
		margin: 0;
	}
	#share {padding : 20px;}
	#share div { 
		display: inline;
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

String num;
Boolean connect = false;
	
try{
    Class.forName(driver);
    conn=DriverManager.getConnection(url,"PRODUCE_DB","3101"); //자신의 아이디와 비밀번호
    connect = true;
    
    stmt = conn.createStatement();
    num = (String) request.getAttribute("num");
    //out.println(num);
    %>
    <%
    rs = stmt.executeQuery("SELECT * FROM PRODUCE_INFO WHERE num="+1);
    
    while(rs.next()) {
    	
    	String name = rs.getString("name");
    	String company = rs.getString("company");
    	String age = rs.getString("age");
    	String blood = rs.getString("blood");
    	String key = rs.getString("key");
    	String weight = rs.getString("weight");
    	String term = rs.getString("term");
    	String hobby = rs.getString("hobby");
    	String specialty = rs.getString("specialty");
    	String one_word = rs.getString("one_word");
    	String one_week = rs.getString("one_week");
    	String two_week = rs.getString("two_week");
    	String three_week = rs.getString("three_week");
    	String five_week = rs.getString("five_week");
    	String six_week = rs.getString("six_week");
    	String eight_week = rs.getString("eight_week");
    	String eleven_week = rs.getString("eleven_week");
    	String final_week = rs.getString("final_week");	
    	
    	
    	String src = "img/practice_people/" + name + ".jpg"; //사진 파일 경로
    	%>
    	
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var dataTable = new google.visualization.arrayToDataTable([
        	['Week', {type: 'string', role: 'annotation'}]
        ]);
        
        dataTable.addColumn('string', 'Week');
        dataTable.addColumn({type: 'string', role: 'annotation'});

        dataTable.addRows([
              [<%=one_week%>+'위', '1주'],
              [<%=two_week%>+'위', '2주'],
              [<%=three_week%>+'위', '3주'],
              [<%=five_week%>+'위', '5주'],
              [<%=six_week%>+'위', '6주'],
              [<%=eight_week%>+'위', '8주'],
              [<%=eleven_week%>+'위', '11주'],
              [<%=final_week%>+'위', 'final']
        ]);

        var options = {
          legend: 'none',
          hAxis: { minValue: 1, maxValue: 8 },
          colors: ['#795548'],
          pointSize: 10,
          pointShape: 'circle',
          
          hAxis: {
              title: '순위',
              viewWindow: {
                min: [1+'주'],
                max: ['final']
              }
            },
            vAxis: {
              title: 'Rating (scale of 1-10)',
              viewWindow: {
            	  min: [101],
            	  max: [1]
              }
            }
       };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(dataTable, options);
    }
    </script>
	
	<div id="corner">
		<div id="company_info"><p><%= company %></p></div>
		<div id="produce_img">
			<img src=<%=src %>/>
		</div>
		<div>
		<p id="name_info"><%=name %></p>
			<table id="produce_info">
				<tr id="info_tr">
					<td>나이</td>
					<td><%=age %></td>
				</tr>
				<tr id="info_tr">
					<td>혈액형</td>
					<td><%=blood %></td>
				</tr>
				<tr id="info_tr">
					<td>키</td>
					<td><%=key %></td>
				</tr>
				<tr id="info_tr">
					<td>몸무게</td>
					<td><%=weight %></td>
				</tr>
				<tr id="info_tr">
					<td>연습생 기간</td>
					<td><%=term %></td>
				</tr>
				<tr id="info_tr">
					<td>취미</td>
					<td><%=hobby %></td>
				</tr>
				<tr id="info_tr">
					<td>특기</td>
					<td><%=specialty %></td>
				</tr>
			</table>
		</div>
		<div id="one_word"><b>한마디</b>&nbsp;&nbsp;<%=one_word %></div>
		<div id="chart_div" style="width: 400px; height: 200px;"></div>
		<div id="share">
			지금 이 참가자를 SNS 공유를 통해 응원하세요!
			<div id="fb-root"></div>
			<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v4.0"></script>
			<div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="small">
				<a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">공유하기</a>
			</div>
			<a href="https://twitter.com/intent/tweet?button_hashtag=tweter&ref_src=twsrc%5Etfw" class="twitter-hashtag-button" data-show-count="false">트윗하기</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
		</div>
	</div>   
	
	<%
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
    <!--연결되었습니다.-->
<%}else{ %>
    <!--연결에 실패하였습니다.-->
<%}

%> 
</body>
</html>