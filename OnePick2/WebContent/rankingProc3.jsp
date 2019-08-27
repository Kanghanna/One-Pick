<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="font.css">
<style>
* {
	margin: 0;
	padding: 0;
	font-family: "돋움", Dotum, notokr-regular !important;
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
display : block
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
			◆연습생 순위는 <b>온라인 투표 및 녹화현장 점수</b>를 합산한 결과입니다.
		</div>

		<%
			request.setCharacterEncoding("UTF-8");

			BufferedReader reader = null;
			int cnt = 0;

			try {
				String filePath = application.getRealPath("/WEB-INF/txt_file/3st_place_ranking.txt");
				reader = new BufferedReader(new FileReader(filePath));

				while (true) {
					String str = reader.readLine();
					cnt++;

					if (str == null)
						break;

					String[] arr = str.split("-"); //arr[0] = 순위 / arr[1] = 연습생 이름

					String src = application.getRealPath("/WEB-INF/연습생/" + arr[1] + ".jpg"); //사진 파일 경로
					String tag_file = application.getRealPath("/WEB-INF/logo/tag_ranking.png"); //1~10등까지 이미지
					String clip_mask = application.getRealPath("/WEB-INF/logo/rank_mask65.png"); //클리핑 마스크
					String r_title = application.getRealPath("/WEB-INF/logo/r_title.png"); //등수 자르는 타이틀
					String tag_src = "tag-" + cnt;
					//out.println(src + "  ");
					//out.println(tag_src);
					
					String [] fname = arr[1].split(" ");
					//out.println(fname[1].length());
					if(fname.length == 2){
						src = application.getRealPath("/WEB-INF/연습생/" + fname[0] + fname[1] + ".jpg"); //사진 파일 경로
					}
					
					if (Integer.parseInt(arr[0]) == 1) { //WEB-INF/연습생/김민규 tag-1
		%>
		<center>
			<div id=<%=tag_src%>>
				<img src=<%=tag_file%>>
			</div>
			<div id="1st">
				<img id="mask_base" src=<%=clip_mask%>> <img id="photo"
					src=<%=src%>>
				<div id="info1"><b><%=arr[1]%></b></div>
			</div>
		</center>
		<%
			} else if (Integer.parseInt(arr[0]) <= 10) {
		%>
		<div id="2-10">
			<div id=<%=tag_src%>>
				<img src=<%=tag_file%>>
			</div>
			<div id=<%=arr[0]%>>
				<img id="mask_base" src=<%=clip_mask%>> <img id="photo"
					src=<%=src%>>
				<div id="info1"><b><%=arr[1]%></b></div>
			</div>
		</div>
		<%
			} else {
		%>
		<%
			if (Integer.parseInt(arr[0]) % 2 == 0) {

				if (Integer.parseInt(arr[0]) == 48) { //울림 김민서 일 때
					src = application.getRealPath("/WEB-INF/연습생/" + arr[1] + "2.jpg");
				}
		%>
				<div id="11-101" width = "45%" float = "left" display = "inline">
					<img id="mask_base" src=<%=clip_mask%> width="100px" height="100px">
					<img id="photo" src=<%=src%> width="100px" height="100px">
					<div id="info">
						<b id="rank_num"><%=arr[0]%>&nbsp;&nbsp;&nbsp;<b><%=arr[1]%></b></b>
					</div>
				</div>
			<%
				} else if (Integer.parseInt(arr[0]) % 2 != 0) {
			%>
					<div id="11-101" width = "45%" float = "right" display = "inline">
						<img id="mask_base" src=<%=clip_mask%> width="100px"
							height="100px"> <img id="photo" src=<%=src%> width="100px"
							height="100px">
						<div id="info">
							<b id="rank_num"><%=arr[0]%>&nbsp;&nbsp;&nbsp;<b><%=arr[1]%></b></b>
						</div>
					</div>
				<%
					}

					}

					if (Integer.parseInt(arr[0]) == 10) {
				%>
				<div id="11-30th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else if (Integer.parseInt(arr[0]) == 30) {
				%>
				<div id="31-50th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else if (Integer.parseInt(arr[0]) == 50) {
				%>
				<div id="51-70th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else if (Integer.parseInt(arr[0]) == 70) {
				%>
				<div id="71-90th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else if (Integer.parseInt(arr[0]) == 90) {
				%>
				<div id="91-101th" display = "block">
					<img src=<%=r_title%>>
				</div>
				<%
					} else { //퇴출한 연습생

							}

						} // while 
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						reader.close();
					}
				%>
	</div>
</body>
</html>