<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#div-col{
		display: inline;
	}
	#logup-title, #logup-form {
		width: 900px;
		margin: 0 auto;
		padding: 10px;
	}
	#logup-title { 
		font-size: 20pt;
		border-bottom: 3px solid #3592ff;
	}
	#logup-form { padding: 50px;}
	
	.form-row { padding: 30px; }
	
</style>
</head>
<body>
<form id="logup-form" action="logupOk.jsp">
<label id="logup-title">회원가입</label>
  <div class="form-row">
    <div class="col-md-4 mb-3" id="div-col">
      <label for="validationServer01">아이디</label>
      <input type="text" class="form-control is-valid" id="id" name="id" placeholder="Id" required>
      <div class="valid-feedback">
       	 사용 가능한 아이디에요!
      </div>
    </div><br>
    <div class="col-md-4 mb-3" id="div-col">
      <label for="validationServer02">비밀번호</label>
      <input type="text" class="form-control is-valid" id="pw" name="pw" placeholder="Password" required>
      <div class="valid-feedback">
        안전한 비밀번호네요!
      </div>
    </div>
    <div class="col-md-4 mb-3" id="div-col">
      <label for="validationServerUsername">닉네임</label>
      <div class="input-group">
        <input type="text" class="form-control is-invalid" id="nickname" name="nickname" placeholder="NickName" aria-describedby="inputGroupPrepend3" required>
        <div class="invalid-feedback">
          20자 이내로 닉네임을 작성하세요.
        </div>
      </div>
    </div>
  </div>
  
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input is-invalid" type="checkbox" id="check" required>
      <label class="form-check-label" for="invalidCheck3">
        가입하시겠습니까?
      </label>
      <div class="invalid-feedback">
        가입 체크 박스를 체크하지 않으셨어요.
      </div>
    </div>
  </div>
  <button id="submit-logup" class="btn btn-primary" type="submit">회원가입</button>
</form>



</body>
</html>