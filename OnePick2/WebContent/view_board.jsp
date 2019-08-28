<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@ include file="css.jsp" %>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<title>게시글 상세 내용</title>
<script>
	$(document).ready(function() {
		
		listReply2(); //등록된 댓글 바로 출력
		
		//댓글 쓰기 버튼을 눌렀을 때 처리 (ajax로 처리)
		$("#btnReply").click(function() {
			var replytext = $("#replytext").val();
			var bno="${dto.bno}";
			var secretReply = false;
			
			if($("#secretReply").is(":checked")){
				secretReply = true;
			}
			
			var param = "replytext=" + replytext + "&bno=" + bno + "&secretReply=" + secretReply;
			$.ajax({
				type:"post",
				url:"${path}/reply/insert.do",
				data:param,
				success:function(){
					alert("댓글이 등록 되었습니다!");
					listReply2(); //등록된 댓글 바로 출력
				}
			});
		});
		
		$("#btnList").click(function() {
			location.href="${path}/board/list.do?";
			history.back();
		});
		
		
		// 게시글 삭제 버튼 클릭 이벤트
		$("#btnDelete").click(function() {
			if(confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/board/delete.do";
				document.form1.submit();
			}
		});
		
		// 게시글 수정 버튼 클릭 이벤트
		$("#btnUpdate").click(function() {
			var title = $("#title").val();
			var content = $("#content").val();
			var writer = $("#writer").val();
			
			if(title == ""){
				alert("제목이 없습니다.");
				document.form1.title.focus();
				return;
			}
			if(content == ""){
				alert("내용이 없습니다.");
				document.form1.content.focus();
				return;
			}
			if(writer == ""){
				alert("글쓴이가 없습니다.");
				document.form1.writer.focus();
				return;
			}
			
			document.form1.action = "${path}/board/update.do";
			document.form1.submit();
		});

		
	});
	
	function listReply2() { //비동기식 댓글 출력 방법
		$.ajax({
			type:"post",
			url:"${path}/reply/listJson.do?bno=${dto.bno}",
			success:function(result) {
				var output = "<table>";
				for(var i in result){
					output += "<tr>";
					output += "<td style='border-bottom:1px solid;'>" + result[i].userName;
					output += "(" + changeDate(result[i].regdate) + ")<br>";
					output += result[i].replytext + "</td>";
					output += "</tr>";
				}
				output += "</table>";
				$("#listReply").html(output); //output에 담긴 것 뿌리기
			}
		});
	}
	
	
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth() + 1;
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
		
		return strDate;
	}
	
</script>
</head>
<body>
<%@ include file="../include/other_menu.jsp" %>
<h2>게시글 상세 내용</h2>
<form name="form1" method="post">
	<table>
		<tr>
			<td colspan="4" align="right">
				<input type="hidden" name="bno" value="${dto.bno}">
				
				<!-- session의 id값과 게시글 글쓴이가 같아야만 버튼 보이게 하기 -->
				<c:if test="${sessionScope.userId == dto.writer}">
					<input id="btnUpdate" type="button" value="수정">
					<input id="btnDelete" type="button" value="삭제">
				</c:if>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${dto.viewcnt}</td>
			<td>글쓴이</td>
			<td>
			<%-- <input id="writer" name="writer" value="${dto.writer}" placeholder="작성자"> --%>
				<!--<c:out value="${sessionScope.userId}"/>-->
				${dto.writer}
			</td>
		</tr>
		<tr colspan="4">
			<td>작성일자</td>
			<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
			</td>
		</tr>
		
		<tr colspan="2">
			<td>글 제목</td>
			<td><input id="title" name="title" value="${dto.title}" placeholder="제목을 입력하세요."></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><input id="content" name="content" value="${dto.content}"
				placeholder="내용을 입력하세요." style="width:400px; height:400px;">
			</td>
		</tr>
		<tr>
			<td><button type="button" id="btnList">목록</button></td>
		</tr>
	</table>
</form>

<div style="width:650px; text-align:center;">
	<c:if test="${sessionScope.userId != null}">
		<input type="checkbox" id="secretReply" style="align:left;">비밀 댓글<br>
		<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요."></textarea><br>
		<button type="button" id="btnReply">댓글 작성</button>
	</c:if>
</div>
<div id="listReply"></div>
</body>
</html>