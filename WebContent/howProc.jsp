<%@page import="travel.Travel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="travel.TravelProc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.cards-container {
  column-break-inside: avoid;
}
.cards-container .card {
  display: inline-block;
  overflow: visible;
}

@media only screen and (max-width: 600px) {
  .cards-container {
    -webkit-column-count: 1;
    -moz-column-count: 1;
    column-count: 1;
  }
}
@media only screen and (min-width: 601px) {
  .cards-container {
    -webkit-column-count: 2;
    -moz-column-count: 2;
    column-count: 2;
  }
}
@media only screen and (min-width: 993px) {
  .cards-container {
    -webkit-column-count: 3;
    -moz-column-count: 3;
    column-count: 3;
  }
}
.text-center {
  text-align: center;
}

</style>
</head>
<body>
 	<%
		request.setCharacterEncoding("UTF-8");
	
		String userID = null;
		
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		int whoNum = 0;
		
		if(request.getParameter("whoNum")!= null){
			whoNum = Integer.parseInt(request.getParameter("whoNum"));
		}
		
		TravelProc travelProc = new TravelProc();
		ArrayList<Travel> list = travelProc.getList(userID, "where whoNum="+whoNum+" order by timestamp desc");
		String who = "";
		switch(whoNum) {
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
		%>
		<div class="container">
		  	<div class="row">
		  	<h1><%=who %>여행, 누구와 갈까?</h1>
		    	<div class="col s12 cards-container">
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
			String how = "";
			//🚗🚎🚲🚅🚂✈🚢🚈🚆🏃🚶
			if(HowAirplane==1){
				how += " ✈ ";
			}
			if(HowTrain==1){
				how += " 🚅 ";
			}
			if(HowBus==1){
				how += " 🚎/🚗/🚈 ";
			}
			if(HowShip==1){
				how += " 🚢 ";
			}
			if(HowWalk==1){
				how += " 🚶 🏃 ";
			}
			if(HowBike==1){
				how += " 🚲 ";
			}
			String timestamp = list.get(i).getTimestamp().substring(0,10);
			String Why = list.get(i).getWhy();
			int Secret = list.get(i).getSecret();
			
			
		%>
		 <div class="card blue-grey darken-1">
         <div class="card-content white-text">
           <span class="card-title"><%=WherePla%>, <%=where %></span>
           <p><label>무엇을?</label><%= What %></p>
           <p><label>뭐 타고 왔니?</label><%= how %></p>
           <p><label>왜?</label><%= What %></p>
         </div>
         <div class="card-action">
           <a href="https://www.google.co.kr/maps/place/<%=WhereLoc%>">구글 지도 보기</a>
         </div>
        </div>
		<%
		}//for
		%>
			</div>
		</div>
	</div>
</body>
</html>