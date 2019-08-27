<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
* {
	font-family: "돋움", Dotum, notokr-regular !important;
}

#title {
	font-size: 20pt;
	border-bottom: 3px solid #3592ff;
	padding: 20px 0;
}

#worldcup { width : 500px; }

#desc {
	padding: 20px 0;
}

#round {
	font-style : bold;
	color : #3592ff;
}
#src {
	
}
#vs {
	width : 100px;
	height : 100px;
}
td > #select { align : center; }
#select  {
	text-align : center;
	width : 80px;
	height : 40px;
	font-size : 20pt;
	background-color: #3592ff;
}
</style>
</head>
<body>
	<div id="title">One Pick 월드컵</div>
	<div id="desc">당신의 One Pick 연습생을 찾아보세요!</div>

	<%
	
	request.setCharacterEncoding("UTF-8");
	
	int rand1 = (int)(Math.random() * 50) + 1;
	int rand2 = (int)(Math.random() * 101) + 51;
	int round = 1;
	int a[] = new int[25];
	int a2[] = new int[25];
	
	for(int i = 1; i < 25; i++){
		if(a[i] == rand1){
			
		}
	}
	for(int i = 26; i < 50; i++){
		
	}
	
	BufferedReader reader = null;
	int cnt = 50;
	String src = "";
	String src2 = "";
	String [] arr2 = new String [101];
	
	
	try {
		String filePath = application.getRealPath("txt_file/1st_place_ranking.txt");
		reader = new BufferedReader(new FileReader(filePath));

		while (true) {
			String str = reader.readLine();
			cnt--;

			String[] arr = str.split("-"); //arr[0] = 순위 / arr[1] = 연습생 이름
			
			/*
			if(rand == Integer.parseInt(arr[0])){
				src = application.getRealPath("/WEB-INF/연습생/" + arr[1] + ".jpg"); //사진 파일 경로	
			}
			*/
			arr2[cnt] = arr[1];
			
			if (cnt == 0) break;

		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		reader.close();
	}
	
	src = application.getRealPath("WEB-INF/img/practice_people/" + arr2[rand1] + ".jpg");
	src2 = application.getRealPath("WEB-INF/img/practice_people/" + arr2[rand2] + ".jpg");
	String vs = application.getRealPath("WEB-INF/img/logo/vs.png");
	
%>

<script>
var round = 32;
var cnt = 0;
	function select() {
		var src = document.getElementId("src").value;
		cnt++;
		round /= 2;
		if(round == 2) round = "결승전"; 
	}
</script>

<center>
	<div>
	<form>
		<table id = "worldcup">
			<tr>
				<td>
					<input type = "radio" id = "src"><img src = <%= src %>>
				</td>
				<td>
					<div id = "round"><%= round %>강</div>
					<img id = "vs" src = <%=vs%>>
				</td>
				<td>
					<input type = "radio" id = "src2"><img src = <%= src2 %>>
				</td>
			</tr>
			<tr>
				<td rowspan = "3">
					<input type = "submit" id = "select" onclick = "select()" value = "선택">
				</td>
			</tr>
		</table>
		</form>
	</div>
	</center>
</body>
</html>