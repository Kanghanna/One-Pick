<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ include file="css.jsp" %>
<title>Insert title here</title>
<style>
#title {
	font-size: 20pt;
	border-bottom: 3px solid #3592ff;
	padding: 20px 0;
}

#desc {
	padding: 20px 0;
}
#img {
	align : center;
	width : 100%;
}
</style>
<style>
	#form1 {
		margin: 0 auto;
	}
	
	#list {
		border: 1px solid gray;
	}
	#cap {
		font-size: 20pt;
		font-family: 'BEBAS';
	}
</style>
<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.href = "${path}/board/write.do";
		});
	});
	
	function list(page) {
		location.href = "${path}/board/list.do?curPage=" + page + "&searchOption=${map.searchOption}&keyword=${map.keyword}";
	}
	
</script>
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
    rs = stmt.executeQuery("SELECT * FROM TBL_BLOB WHERE num="+ 1);
    
    while(rs.next()) {
    	
    	String name = rs.getString("name");
    	String company = rs.getString("company");
    	String age = rs.getString("age");
    	
    	
    	String src = application.getRealPath("WEB-INF/img/commu_image/" + name + ".jpg"); //사진 파일 경로
    	%>
<%
	String src = application.getRealPath("/WEB-INF/img/commu_image/김요한.jpg");
%>
<div id = "title">김요한.com</div>
<div id = "desc">김요한 연습생의 개인 커뮤니티</div>
<img src = <%=src%>>

<!-- 검색 기능 폼 (검색어를 넣어서 목록에게 넘겨야함) -->
<form id="form1" name="form1" method="post" action="${path}/board/list.do">
	<select name="searchOption">
		<option value="all" <c:out value="${map.searchOption == 'all' ? 'selected' : ''}"/>>
			제목 + 글쓴이 + 내용
		</option>
		<option value="writer" <c:out value="${map.searchOption == 'writer' ? 'selected' : ''}" />>
			글쓴이
		</option>
		<option value="content" <c:out value="${map.searchOption == 'content' ? 'selected' : ''}" />>
			내용
		</option>
		<option value="title" <c:out value="${map.searchOption == 'title' ? 'selected' : ''}" />>
			제목
		</option>
	</select>
	
	<input name="keyword" value="${map.keyword}"> <!-- 검색 키워드 값 작성란 -->
	<input type="submit" value="조회">
	
	<!-- 로그인 했을 때만 글쓰기 버튼 보이기 -->
	<c:if test="${sessionScope.userId != null}">
		<input id="btnWrite" type="button" value="글쓰기">
	</c:if>
</form>


${map.count}개의 게시물이 있습니다.


<!-- 게시판 목록 -->
<caption id="cap">NOTICE</caption>
<table id="list" width="700px">
	<tr>
		<th>글번호</th>
		<th>글 제목</th>
		<th>글쓴이</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<c:forEach var="row" items="${map.list}">
	<tr>
		<td>${row.bno}</td>
		<td>
			<!--<a href="${path}/board/view.do?bno=${row.bno}">${row.title}</a>-->
			<a href="${path}/board/view.do?bno=${row.bno}
			&curPage=${map.boardPager.curPage}&searchOption=
			${map.searchOption}&keyword=${map.keyword}">${row.title}</a>
			
			<c:if test="${row.recnt > 0}">
				<span style="color:red;">(${row.recnt})</span>
			</c:if>
		</td>
		
		<td>${row.writer}</td>
		<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
		<td>${row.viewcnt}</td>
	</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5">
		<c:if test="${map.boardPager.curBlock > 1}">
			<a href="javascript:list('1')">[처음]</a>
		</c:if>
		
		<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
			<c:choose>
				<c:when test="${num==map.boardPager.curPage}">
					<span style="color:red">${num}</span> <!-- 색상변경 -->
				</c:when>
				
				<c:otherwise>
					<a href="javascript:list('${num}')"> | ${num} | </a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 끝 페이지 -->
		<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
			<a href="javascript:list('5')"> [끝] </a>
		</c:if>
		</td>
	</tr>
</table>
</body>
</html>