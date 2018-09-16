<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.gender label{
	position: relative;
	cursor: pointer;
	font-size: 1.2rem;
}

.gender input[type="radio"] + .label-text:before{
	content: "\f10c";
	font-family: "FontAwesome";
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	-webkit-font-smoothing:antialiased;
	width: 1em;
	display: inline-block;
	margin-right: 5px;
}

.gender input[type="radio"]:checked + .label-text:before{
	content: "\f192";
	color: #8e44ad;
	animation: effect 250ms ease-in;
}

.gender input[type="radio"]:disabled + .label-text{
	color: #aaa;
}

.gender input[type="radio"]:disabled + .label-text:before{
	content: "\f111";
	color: #ccc;
}
@keyframes effect{
	0%{transform: scale(0);}
	25%{transform: scale(1.3);}
	75%{transform: scale(1.4);}
	100%{transform: scale(1);}
}
</style>
</head>
<body>
	<div class="joinForm_div">
		<form method="post" action="joinProc.jsp">
			<br><br><br><div>
				<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
			</div><br>
			<div>
				<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
			</div><br>
			<div>
				<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
			</div><br>
			<div>
				<input type="text" class="form-control" placeholder="닉네임" name="userNickname" maxlength="20">
			</div><br>
			<div class="gender">
				<div class="form-check">
					<label> 
						<input type="radio" name="userGender" value="man"> 
						<span class="label-text">남자</span>
					</label>
				</div>
				<div class="form-check">
					<label> 
						<input type="radio" name="userGender" value="woman" checked> 
						<span class="label-text">여자</span>
					</label>
				</div>
				</div>
			<div>
				<input type="date" placeholder="생년월일" name="userBirth" maxlength="30">
			</div><br><br>
			<input type="submit" value="회원가입" id="in"><br><br>
			<br><br>
		</form>
	</div>
</html>