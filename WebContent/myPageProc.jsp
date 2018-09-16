<%@page import="travel.Travel"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@page import="travel.TravelProc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/card.css" />
</head>
<body>
 	<%
		request.setCharacterEncoding("UTF-8");
	
		String userID = null;
		
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		String query= "";
		TravelProc travelProc = new TravelProc();
		//전체/과거/미래/당일치기/2~7일/장기
		
		
			query = "where userID='"+userID+"' order by timestamp desc";
			String when = "나의 여행기";
		//과거/미래/당일치기/2~7일/장기
				ArrayList<Travel> list = travelProc.getList(userID, query);
		%>
		<div class="container">
		  	<h1><%=when %></h1>
		    	<ul class="grid">
		<%
		
		for(int i = 0; i < list.size(); i++){
			int ID = list.get(i).getID();
			String UserID = list.get(i).getUserID();
			int WhoNum = list.get(i).getWhoNum();
			
			String WhoWith = list.get(i).getWhoWith();
			
			String WhereCountry = list.get(i).getWhereCountry();
			String WhereRegion = list.get(i).getWhereRegion();
			String WhereCity = list.get(i).getWhereCity();
			String WhereLoc = list.get(i).getWhereLoc();
			String WherePla = list.get(i).getWherePla();
			String where = WhereCountry+", "+ WhereRegion+", "+ WhereCity;
			String WhenStart = list.get(i).getWhenStart().substring(0,10);
			String WhenEnd = list.get(i).getWhenEnd().substring(0,10);
			
			String What = list.get(i).getWhat();
			
			int HowAirplane = list.get(i).getHowAirplane();
			int HowTrain = list.get(i).getHowTrain();
			int HowBus = list.get(i).getHowBus();
			int HowShip = list.get(i).getHowShip();
			int HowWalk = list.get(i).getHowWalk();
			int HowBike = list.get(i).getHowBike();
			String who="";
			switch(WhoNum) {
		    case 1: who = "나 혼자";
		         break;
		    case 2: who = "친구들과";
		         break;
		    case 3: who = "가족과";
	       		break;
		    case 4: who = "연인과";
	       		break;
		    case 5: who = "패키지 여행객들과";
	        	break;
		    case 6: who = "또 다른 사람들과";
	        	break;
			}
			
			String how = "";
			//🚗🚎🚲🚅🚂✈🚢🚈🚆🏃🚶
			if(HowAirplane==1){
				how += "_ ✈ _";
			}
			if(HowTrain==1){
				how += "_ 🚅 _";
			}
			if(HowBus==1){
				how += "_ 🚎/🚗/🚈 _";
			}
			if(HowShip==1){
				how += "_ 🚢 _";
			}
			if(HowWalk==1){
				how += "_ 🚶 🏃 _";
			}
			if(HowBike==1){
				how += "_ 🚲 _";
			}
			String timestamp = list.get(i).getTimestamp().substring(0,10);
			String Why = list.get(i).getWhy();
			int Secret = list.get(i).getSecret();
			
			
		%>
		<li class="item">
		    <div class="box">
		      <h3 class="title"><span><%=WherePla%></span>
		      </h3>
		      <p class="byline"><%=where %></p>
		      <p class="type"><%=WhenStart%>-<%=WhenEnd%></p>
		      <p><label>누구랑?</label><%= who%>(<%= WhoWith%>) </p>
	          <p><label>무엇을?</label><%= What %></p>
	          <p><label>뭐 타고?</label><%= how %></p>
	          <p><label>왜?</label><%= Why %></p>
	          <br>
	          <a href="https://www.google.co.kr/maps/place/<%=WhereLoc%>">구글 지도 보기</a>
           	  <b><%=timestamp %></b>
		    </div>
		  </li>
		<%
		}//for
		%>
		</ul>
	</div>
</body>
</html>