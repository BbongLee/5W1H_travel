var map;// map 전역변수 선언.
var marker;
var mapContainer;
var lat, lon;
window.onload = function() {
	mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(37.715133, 126.734086), // 지도의 중심좌표
		level : 13
	// 지도의 확대 레벨
	};
	

	map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도
		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
		// handleRefresh();
	}
}// myLocation



// 지도에 마커와 인포윈도우를 표시하는 함수입니다. (내 위치 표시용)
function displayMarker(locPosition, message) {

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
		map : map,
		position : locPosition
	});

	var iwContent = message, // 인포윈도우에 표시할 내용
	iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
		content : iwContent,
		removable : iwRemoveable
	});

	// 인포윈도우를 마커위에 표시합니다
	infowindow.open(map, marker);

	// 지도 중심좌표를 접속위치로 변경합니다
	map.setCenter(locPosition);
}
/*
<%=latitude%>,<%=longitude%>,<%=who%>,
<%=WhoWith%>,<%=WhereCountry%>,<%=WhereRegion%>,
<%=WhereCity%>,<%=WherePla%>,<%=WhenStart%>,
<%=WhenEnd%>,<%=What%>,<%=HowAirplane%>,
<%=HowTrain%>,<%=HowBus%>,<%=HowShip%>,
<%=HowWalk%>,<%=HowBike%>,<%=timestamp%>,
<%=Why%>,<%=Secret%>
*/
// 마커추가
function addMarker(latitude, longitude, UserID,who, WhoWith, WhereCountry, WhereRegion, WhereCity, 
		WherePla,WhenStart,WhenEnd,
		What, HowAirplane,HowTrain,
		HowBus, HowShip, HowWalk,
		HowBike, timestamp,Why,Secret) {
	// 이미지 마커 맵에 추가
	var imageSize = new daum.maps.Size(70, 70); // 마커의 크기(daummap에서 size 검색, 크기정보를 가지고 있는 사이즈 객체 생성)
	var imageOption = {
		offset : new daum.maps.Point(14, 28)
	};
	var imageSrc = "mark.png";
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
			imageOption), markerPosition = new daum.maps.LatLng(latitude,
			longitude);
	var marker = new daum.maps.Marker({
		position : markerPosition,
		image : markerImage,
		clickable : true
	});

	marker.setMap(map);
	var when;
	if(WhenStart==WhenEnd){
		when = WhenStart;
	}else{
		var stDate = new Date(WhenStart) ;
	    var endDate = new Date(WhenEnd) ;
	 
	    var btMs = endDate.getTime() - stDate.getTime() ;
	    var btDay = btMs / (1000*60*60*24) ;
	    when = WhenStart+" ~ "+WhenEnd+" / "+btDay+"일";
	    
	    console.log(btDay);
	}
	var how = "";
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
	var content = 
		'<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    '            ' +WherePla+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+timestamp+
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="desc">' + 
    '				 <div class="prit"><b>id</b> : '+ UserID+'</div>' + 
    '				 <div class="prit"><b>누구랑?</b> : '+ who +" ("+WhoWith+')</div>' + 
    '				 <div class="prit"><b>언제?</b> : '+ when+'</div>' + 
    '                <div class="prit"><b>어디서?</b> : '+ WhereCountry+", "+WhereRegion+", "+WhereCity+'</div>' + 
    '				 <div class="prit"><b>무엇을 했니?</b> : '+ What +'</div>' + 
    '				 <div class="prit"><b>어떻게 갔니?</b> : '+ how+'</div>' + 
    '                <div class="prit"><b>왜?</b> : '+ Why+'</div>' + 
    '            </div>' + 
    '        </div>' + 
    '        </div>' + 
    '    </div>';
		/*
		'<div class="overlaybox">' +
    '    <div class="boxtitle">'+WhereCountry+", "+WhereRegion+", "+WhereCity+'</div>' +
    '    <ul>' +
    '        <li>' +
    '            <span class="number">'+who+'</span>' +
    '            <span class="title">'+WhoWith+'</span>' +
    '        </li>' +
    '        <li>' +
    '            <span class="number">3</span>' +
    '            <span class="title">해적(바다로 간 산적)</span>' +
    '        </li>' +
    '    </ul>' +
    '</div>';
		
		
		"<div class='wrap'>"
			+ 
			+ '<b>' + WhoWith + '</b>' + '<br>' + "주소 : " + WhoWith + "<br></div>";
*/
	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	var iwContent = content, // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가
	iwRemoveable = true,			// 가능합니다
	iwPosition = markerPosition; // 인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
		position : iwPosition,
		content : iwContent,
		removable : iwRemoveable,
		zIndex : 10
	});

	// 마커에 클릭이벤트를 등록합니다
	daum.maps.event.addListener(marker, 'click', function() {
		// 마커 위에 인포윈도우를 표시합니다
		infowindow.open(map, marker);
	});
	
}
// 오류찾는 함수
function displayError(error) {
	var errorTypes = {
		0 : "Unknown error",
		1 : "Permission denied",
		2 : "Position is not available",
		3 : "Request timeout"
	};
	var errorMessage = errorTypes[error.code];
	if (error.code == 0 || error.code == 2) {
		errorMessage = errorMessage + " " + error.message;
	}
	var div = document.getElementById("location");
	div.innerHTML = errorMessage;
}

