<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" type="text/css" href="font.css">
<style>
* {
	font-family: "돋움", Dotum, notokr-regular !important;
	text-decoration: none;
	color: #3592ff;
}

#rank_chd, #rank_chd #chd1, #rank_chd #chd2, #comm_chd #chd1, #comm_chd #chd2 {
	/*display: none; /*서브 메뉴 안보이게 하기 */
	width: 330px;
	height: 40px;
	left: -200px;
	position: absolute;
}

#rank_chd #chd1, #rank_chd #chd2 {
	display: inline-block;
	top : -20px;
}

#rank_chd #chd1 {
	width: 20px;
	left: -220px;
}

#week {
	display: inline-block;
	top : 20px;
	left : -100px;
}

#comm_chd #chd1, #comm_chd #chd2 {
	top : 10px;
	left : -200px;
}

#ranking : hover li {
	display: block;
}

p {
	display: inline-block;
	color: white;
	padding: 30px;
}

#top {
	width: 100%;
	height: 300px;
	color: black;
	text-decoration: none;
}

#top_menu {
	margin: 0 auto;
}


#top_menu ul {
	position: absolute;
	border: 5px;
	padding: 20px 8px;
	top: 135px;
	left: 31%;
	font-weight : bold;
}

#top_menu ul li : hover {color : #2EFEF7;}

#top_menu li, #top_menu li p {
	display: inline-block;
	color: white;
}

#top_logo {
	width: 100%;
	height: 250px;
	clip: rect(0, 500px, 250px, 30px);
}

</style>
</head>
<body>
	<%
		String header = application.getRealPath("/image/logo/op_header_bg.png"); ///WEB-INF/lib/
		String chd_menu1 = application.getRealPath("/image/logo/child_menu_left.png");
		String chd_menu2 = application.getRealPath("/image/logo/child_menu.png");
	%>

	<a href="ranking3.jsp">
		<div id="top">
			<img id="top_logo" src=<%=header%>>
			<center>
			<div id="top_menu">
				<ul>
					<li><a id="ranking" href="ranking3.jsp">연습생 순위</a></li>
					<ul id = "rank_chd">
						<img id="chd1" src=<%=chd_menu1%>>
						<img id="chd2" src=<%=chd_menu2%>>
						<li id = "week"><a href="rankingProc1.jsp">1주차</a></li>&nbsp;
						<li id = "week"><a href="rankingProc2.jsp">2주차</a></li>&nbsp;
						<li id = "week"><a href="rankingProc3.jsp">3주차</a></li>&nbsp;
					</ul>
					<li>
						<p>|</p> <a href="worldcup.jsp">one-pick 월드컵</a>
					</li>
					<li>
						<p>|</p> <a href="event.jsp">이벤트</a>
					</li>
					<li>
						<p>|</p> <a href="event.jsp">커뮤니티</a>
					</li>
					<ul id = comm_chd">
						<img id="chd1" src=<%=chd_menu1%>>
						<img id="chd2" src=<%=chd_menu2%>>
						<li><a href="board.jsp">김요한</a></li>
						<li><a href="board.jsp">김민규</a></li>
						<li><a href="board.jsp">이은상</a></li>
						<li><a href="board.jsp">송형준</a></li>
						<li><a href="board.jsp">남도현</a></li>
						<li><a href="board.jsp">김우석</a></li>
						<li><a href="board.jsp">손동표</a></li>
						<li><a href="board.jsp">송유빈</a></li>
						<li><a href="board.jsp">구정모</a></li>
						<li><a href="board.jsp">박선호</a></li>
						<li><a href="board.jsp">차준호</a></li>
					</ul>
				</ul>
			</div>
			</center>
		</div>
	</a>
</body>