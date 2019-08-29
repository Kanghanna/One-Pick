<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
}
#tb-template {
	margin : 0 auto;
	width: 1500px;
	padding: 20px;
}
td { align: center;}
<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
	text-decoration: none;
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
	padding: 30px;
}

#top {
	width: 100%;
	height: 300px;
	text-decoration: none;
	margin: 0 auto;
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
}

#top_logo {
	width: 100%;
	height: 250px;
	clip: rect(0, 500px, 250px, 30px);
}

#login_link, #logup_link, #logout_link {
	position: absolute;
	width: 100px;
	top: 30px;
	left: 1340px;
	display: block;
	color: white;
	z-index: 1;
}

#logup_link { left : 1400px;}
#logout_link { left: 1320px;}

#navbar {
	color: #0064DC !important;
	text-align: center;
}

#navbar li { 
	margin-right : 40px;
	border-top: 0 transant !important;
}

#top > #navbar-nav { align: center; }


</style>

</head>


<body>
	<%
	String contentPage = request.getParameter("CONTENTPAGE");
	//String uri = request.getRequestURI().toString(); 
	//String pageName = uri.substring(uri.lastIndexOf("/") + 1, uri.length());
	//out.println(pageName);
	%>
<div>
<table id="tb-template">
			<tr>
				<td>
					<%
		String header = "img/logo/op_header_bg.png"; ///WEB-INF/lib/
		String chd_menu1 = "img/logo/child_menu_left.png";
		String chd_menu2 = "img/logo/child_menu.png";
	%>

		<div id="top">
			<img id="top_logo" src=<%=header%>>
			<c:choose>
				<c:when test="application.getAttribute('id')==null"><a id="login_link" href="login.jsp">로그인</a></c:when>
				<c:otherwise><a id="logout_link" href="logout.jsp">로그아웃</a></c:otherwise>
			</c:choose>
			<a id="logup_link" href="logup.jsp">회원가입</a>
			
				<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar">
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				    	<span class="navbar-toggler-icon"></span>
				  	</button>
				  	
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
					    <ul class="navbar-nav">
					    
					      <li class="nav-item dropdown">
					        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					         	 연습생 순위
					        </a>
					        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					          	<a class="dropdown-item" href="/ranking1.jsp?week=one_week">1주차</a>
						    	<a class="dropdown-item" href="/ranking1.jsp?week=two_week">2주차</a>
						    	<a class="dropdown-item" href="/ranking1.jsp?week=three_week">3주차</a>
						    	<a class="dropdown-item" href="/ranking1.jsp?week=five_week">5주차</a>
						    	<a class="dropdown-item" href="/ranking1.jsp?week=eight_week">8주차</a>
						    	<a class="dropdown-item" href="/ranking1.jsp?week=eleven_week">11주차</a>
						    	<a class="dropdown-item" href="/ranking1.jsp?week=final_week">Final</a>
					        </div>
					      </li>
					      
					      <li class="nav-item">
					        <a class="nav-link" href="worldcup.jsp">one-pick 월드컵</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link" href="twitter.jsp">twitter 정보</a>
					      </li>
					      
					      <li class="nav-item dropdown">
					        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					         	 커뮤니티
					        </a>
					        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					        	<a class="dropdown-item" href="board.jsp?rq_name=김요한">김요한</a>
								<a class="dropdown-item" href="board.jsp?rq_name=김우석">김우석</a>
								<a class="dropdown-item" href="board.jsp?rq_name=한승우">한승우</a>
								<a class="dropdown-item" href="board.jsp?rq_name=송형준">송형준</a>
								<a class="dropdown-item" href="board.jsp?rq_name=조승연">조승연</a>
								<a class="dropdown-item" href="board.jsp?rq_name=손동표">손동표</a>
								<a class="dropdown-item" href="board.jsp?rq_name=이한결">이한결</a>
								<a class="dropdown-item" href="board.jsp?rq_name=남도현">남도현</a>
								<a class="dropdown-item" href="board.jsp?rq_name=차준호">차준호</a>
								<a class="dropdown-item" href="board.jsp?rq_name=강민희">강민희</a>
								<a class="dropdown-item" href="board.jsp?rq_name=이은상">이은상</a>
					        </div>
					      </li>
					    </ul>
					 </div>
				</nav>
		</div>
				</td>
			</tr>
			<tr>
				<td width="80%" valign="top">
					<jsp:include page="<%=contentPage%>"/>
				</td>
			</tr>
			<tr>
				<td width="80%" valign="bottom">
					<jsp:include page="bottom.jsp"/>
				</td>
			</tr>
		</table>
</body>
</html>