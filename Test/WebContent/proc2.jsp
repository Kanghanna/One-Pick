<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		int id1 = Integer.parseInt(request.getParameter("id1"));
		int id2 = Integer.parseInt(request.getParameter("id2"));
		int id3 = Integer.parseInt(request.getParameter("id3"));
		int key = 0;
		int count = 0;
		int min = 0;

		//방법 1 : 전체 조건값을 다 실행(1~1000)
		/*
		for(int i = 1; i <= 1000; i++){
			count++;
			if(id1 % i ==0 && id2 % i == 0 && id3 % i == 0)
				key = i;
		}
		*/

		//방법 2 : 조건값 중 하나를 지정
		/*
		for(int i = 1; i <= id1; i++){
			count++;
			if(id1 % i ==0 && id2 % i == 0 && id3 % i == 0)
				key = i;
		}
		*/

		//방법 3 : 삼항 연산자 사용
		min = (id1 < id2) ? (id1 < id3) ? id1 : id3 : (id2 < id3) ? id2 : id3;
		for (int i = 1; i <= min; i++) {
			count++;
			if (id1 % i == 0 && id2 % i == 0 && id3 % i == 0)
				key = i;
		}

		//방법 4 : 메소드 사용
		for (int i = 1; i <= min(id3, min(id1, id2)); i++) {
			count++;
			if (id1 % i == 0 && id2 % i == 0 && id3 % i == 0)
				key = i;
		}
	%>
	
	<%!
		public static int min(int a, int b) {
			if(a>b){
				return b;
			}else {
				return b;
			}
		}
	%>

	<b><%=name%></b>님의 만능키 값은
	<b><%=key%></b> 입니다.
	<b>실행 횟수</b>는 총
	<b><%=count%></b>회 입니다.
</body>
</html>