<%@page import="travel.Travel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="travel.TravelProc"%>
<%@page import="travelUser.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=81ba47be0c9913ca2c005ff1ba5aa01a&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=81ba47be0c9913ca2c005ff1ba5aa01a"></script>
<script src="assets/js/map.js"></script>
<style>
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 400px;min-height: 300px;padding: 5px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .body {position: relative;}
    .info .desc {position: relative;margin: 2px;height: 75px;}
    .info .link {color: #5085BB;}
    .prit{
    
    }
    .prit label{
    
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
		
	%>
	<script>
	function goMarker(){
	<%
		TravelProc travelProc = new TravelProc();
		ArrayList<Travel> list = travelProc.getList(userID, "order by timestamp desc");
		
		
		for(int i = 0; i < list.size(); i++){
			int ID = list.get(i).getID();
			String UserID = list.get(i).getUserID();
			int WhoNum = list.get(i).getWhoNum();
			String who = "";
			String WhoWith = list.get(i).getWhoWith();
			
			String WhereCountry = list.get(i).getWhereCountry();
			String WhereRegion = list.get(i).getWhereRegion();
			String WhereCity = list.get(i).getWhereCity();
			String WhereLoc = list.get(i).getWhereLoc();
			String WherePla = list.get(i).getWherePla();
			
			String WhenStart = list.get(i).getWhenStart().substring(0,10);
			String WhenEnd = list.get(i).getWhenEnd().substring(0,10);
			
			String What = list.get(i).getWhat();
			
			int HowAirplane = list.get(i).getHowAirplane();
			int HowTrain = list.get(i).getHowTrain();
			int HowBus = list.get(i).getHowBus();
			int HowShip = list.get(i).getHowShip();
			int HowWalk = list.get(i).getHowWalk();
			int HowBike = list.get(i).getHowBike();
			
			String timestamp = list.get(i).getTimestamp().substring(0,10);
			String Why = list.get(i).getWhy();
			int Secret = list.get(i).getSecret();
			
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
		%>
		//latitude, longitude, who, when, where, what, how, time, why
		<%
		String[] latlong =  WhereLoc.split(",");
		double latitude = Double.parseDouble(latlong[0]);
		double longitude = Double.parseDouble(latlong[1]);
		%>
		addMarker(<%=latitude%>,<%=longitude%>,"<%=UserID%>","<%=who%>",
				"<%=WhoWith%>","<%=WhereCountry%>","<%=WhereRegion%>",
				"<%=WhereCity%>","<%=WherePla%>","<%=WhenStart%>",
				"<%=WhenEnd%>","<%=What%>",<%=HowAirplane%>,
				<%=HowTrain%>,<%=HowBus%>,<%=HowShip%>,
				<%=HowWalk%>,<%=HowBike%>,"<%=timestamp%>",
				"<%=Why%>",<%=Secret%>
				);
		<%
			}
		%>
		}
		//function
		
		</script>	
<div id="map" style="width:95%; height:700px;"></div> 
<button onclick="goMarker()">마커 불러오기</button>

</body>
</html>