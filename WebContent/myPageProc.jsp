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
<style>
.cards-container {
  -webkit-column-break-inside: avoid;
          page-break-inside: avoid;
               break-inside: avoid;
}
.cards-container .card {
  display: inline-block;
  overflow: visible;
  background-color: #eee;
  margin: 2rem auto;
  padding:10px;
  
}

.card-action{
width:100%;
text-align:right;
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
.card-title{
font-size:130%;
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
		
		String query= "";
		TravelProc travelProc = new TravelProc();
		//전체/과거/미래/당일치기/2~7일/장기
		
		
			query = "where userID='"+userID+"' order by timestamp desc";
			String when = "나의 여행기";
		//과거/미래/당일치기/2~7일/장기
				ArrayList<Travel> list = travelProc.getList(userID, query);
		%>
		
		<div class="container">
		  	<div class="row">
		  	<h1><%=when %></h1>
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
		 <div class="card blue-grey darken-1">
         <div class="card-content white-text">
           <span class="card-title"><%=WherePla%>, <%=where %></span>
           <p><label>무엇을?</label><%= What %></p>
           <p><label>뭐 타고 왔니?</label><%= how %></p>
           <p><label>왜?</label><%= Why %></p>
         </div>
         <div class="card-action">
           <a href="https://www.google.co.kr/maps/place/<%=WhereLoc%>">구글 지도 보기</a>
           <b><%=timestamp %></b>
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