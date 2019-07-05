<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr>
bottom.jsp <br>
[찾아오시는길] | [개인보호정책] | [도움말] | [약관]
<br>

<%
	Date date = new Date();
%>

오늘 날짜는 <%= date.getMonth() %>월 <%= date.getDate() %>일 입니다.