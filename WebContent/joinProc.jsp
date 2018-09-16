<%@page import="travelUser.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="travelUser.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userNickname" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userBirth" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		
		// 이미 로그인되어있는 지 확인
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null){
			session.setAttribute("userID", user.getUserID());
			out.println("<script>");
			out.println("alert('이미 가입되어있습니다.');");
			out.println("location.href='index.jsp';");
			out.println("</script>");
		}
		out.println(user.getUserID()+user.getUserNickname()+user.getUserBirth());
		// 입력 다 했는 지 check
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
		|| user.getUserNickname() == null || user.getUserGender() == null || user.getUserBirth() == null){
			out.println("<script>");
			out.println("alert('입력 안 된 사항이 있습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else { // 입력 다 했으면, join
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')"); // 데이터베이스 오류
				script.println("history.back()");
				script.println("</script>");
			} else if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 닉네임입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} /*else if(result2 == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('table 생성 실패.')"); // 데이터베이스 오류
				script.println("history.back()");
				script.println("</script>");
			}*/ else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>