<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
	font-style:'맑은 고딕';
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
input{
  background:#000000;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
input:hover{
  background:#fff;
  color:#1AAB8A;
}
input:before,input:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #fff;
  transition:400ms ease all;
}
input:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
input:hover:before,input:hover:after{
  width:100%;
  transition:800ms ease all;
}
#in{
	border-radius:10px;
	margin-left:500px;	
	font-size:1em;
}
</style>
<body>
	<div class="joinForm_div">
	<center>
		<form method="post" action="loginProc.jsp"> <!-- submit 클릭 시 loginAction.jsp로 가거라 -->
			<div class="form-group">
			<br><br><br>
				<input type="text" placeholder="아이디를 입력하세요" name="userID" maxlength="20"><br><br>
			</div>
			<div class="form-group">
				<input type="password" placeholder="비밀번호를 입력하세요" name="userPassword" maxlength="20"><br><br>
			</div>
			<input type="submit" value="로그인" id="in">

<br><br><br>
</html>