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
    conn=DriverManager.getConnection(url,"PRODUCE_DB","3101"); //�ڽ��� ���̵�� ��й�ȣ
    connect = true;
    
    stmt = conn.createStatement();
    num = (String) request.getAttribute("num");
    rs = stmt.executeQuery("SELECT * FROM TBL_BLOB WHERE num="+ 1);
    
    while(rs.next()) {
    	
    	String name = rs.getString("name");
    	String company = rs.getString("company");
    	String age = rs.getString("age");
    	
    	
    	String src = application.getRealPath("WEB-INF/img/commu_image/" + name + ".jpg"); //���� ���� ���
    	%>
<%
	String src = application.getRealPath("/WEB-INF/img/commu_image/�����.jpg");
%>
<div id = "title">�����.com</div>
<div id = "desc">����� �������� ���� Ŀ�´�Ƽ</div>
<img src = <%=src%>>

<!-- �˻� ��� �� (�˻�� �־ ��Ͽ��� �Ѱܾ���) -->
<form id="form1" name="form1" method="post" action="${path}/board/list.do">
	<select name="searchOption">
		<option value="all" <c:out value="${map.searchOption == 'all' ? 'selected' : ''}"/>>
			���� + �۾��� + ����
		</option>
		<option value="writer" <c:out value="${map.searchOption == 'writer' ? 'selected' : ''}" />>
			�۾���
		</option>
		<option value="content" <c:out value="${map.searchOption == 'content' ? 'selected' : ''}" />>
			����
		</option>
		<option value="title" <c:out value="${map.searchOption == 'title' ? 'selected' : ''}" />>
			����
		</option>
	</select>
	
	<input name="keyword" value="${map.keyword}"> <!-- �˻� Ű���� �� �ۼ��� -->
	<input type="submit" value="��ȸ">
	
	<!-- �α��� ���� ���� �۾��� ��ư ���̱� -->
	<c:if test="${sessionScope.userId != null}">
		<input id="btnWrite" type="button" value="�۾���">
	</c:if>
</form>


${map.count}���� �Խù��� �ֽ��ϴ�.


<!-- �Խ��� ��� -->
<caption id="cap">NOTICE</caption>
<table id="list" width="700px">
	<tr>
		<th>�۹�ȣ</th>
		<th>�� ����</th>
		<th>�۾���</th>
		<th>�ۼ���</th>
		<th>��ȸ��</th>
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
			<a href="javascript:list('1')">[ó��]</a>
		</c:if>
		
		<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
			<c:choose>
				<c:when test="${num==map.boardPager.curPage}">
					<span style="color:red">${num}</span> <!-- ���󺯰� -->
				</c:when>
				
				<c:otherwise>
					<a href="javascript:list('${num}')"> | ${num} | </a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- �� ������ -->
		<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
			<a href="javascript:list('5')"> [��] </a>
		</c:if>
		</td>
	</tr>
</table>
</body>
</html>