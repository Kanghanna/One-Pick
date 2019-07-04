<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

아아<br>

<%!
	String str1 = "전역 변수";
%>

아아2<br>

<%! public String getStr() {
		return str1;
	}
%>

아아3<br>

<%
	String str2 = "지역 변수";
	out.println(str1 + "<br>");
	out.println(str2 + "<br>");
%>

<%= str1 %> <br>
<%= str2 %> <br>


<%
	String str[] = {"JSP", "JAVA", "Android", "HTML5"};
	int i = (int)(Math.random() * str.length);
%>

<%= str[i] %> 재미있다.


<%
	StringBuffer sf = new StringBuffer("지향아 미안해 아빠가 치킨사줄게");
	sf.reverse();
	out.println("객체의 내용 : " + sf.toString());
%>
