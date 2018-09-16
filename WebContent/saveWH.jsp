<%@page import="travel.TravelProc"%>
<%@page import="travelUser.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = null;
	
	// 로그인 되어있는 지 확인
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} else {
		TravelProc travelProc = new TravelProc();
		
		int howAirplane=0;
		int howTrain=0;
		int howBus=0;
		int howShip=0;
		int howWalk=0;
		int howBike=0;
		
		String whoWith = request.getParameter("whoWith");
		int whoNum = Integer.parseInt(request.getParameter("whoNum"));
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		String country = request.getParameter("country");
		
		String region = request.getParameter("region");
		String city = request.getParameter("city");
		String loc = request.getParameter("loc");
		String whereTxt = request.getParameter("whereTxt");
		
		out.write(country+" "+region+" "+city);
		
		String whatTxt = request.getParameter("whatTxt");
		if(request.getParameter("howAirplane")!=null){
			howAirplane = 1;
		}else{
			howAirplane = 0;
		}
		
		if(request.getParameter("howTrain")!=null){
			howTrain = 1;
		}else{
			howTrain = 0;
		}
		
		if(request.getParameter("howBus")!=null){
			howBus = 1;
		}else{
			howBus = 0;
		}
		
		if(request.getParameter("howShip")!=null){
			howShip = 1;
		}else{
			howShip = 0;
		}
		
		if(request.getParameter("howWalk")!=null){
			howWalk = 1;
		}else{
			howWalk = 0;
		}
		
		if(request.getParameter("howBike")!=null){
			howBike = 1;
		}else{
			howBike = 0;
		}
		
		String whyTxt = request.getParameter("whyTxt");
		
		int result = travelProc.write(userID, whoNum, whoWith, 
				country, region, city, loc, whereTxt, startDate, endDate,
				whatTxt, howAirplane, howTrain, howBus, 
				howShip, howWalk, howBike, whyTxt
				);
		
		if(result == -1) { 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패하였습니다.')"); // 데이터베이스 오류
			script.println("history.back()");
			script.println("</script>");
		} 
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('저장하였습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
	}
%>
</body>
</html>