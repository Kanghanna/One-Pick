<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//DB 작업
	
	if(id.equals("choi")) {
		
		if(pw.equals("1234")){ %>
			<jsp:forward page = "loginOK.jsp"/>		
<%		} else { %>
			<jsp:forward page = "login.jsp"/>			
<%		}
		
	} else { %>
		<jsp:forward page="insert.jsp"/>	
		
<%	}
%>