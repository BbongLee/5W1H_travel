<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#who label{
	position: relative;
	cursor: pointer;
	font-size: 1.2rem;
}

#who input[type="radio"] + .label-text:before{
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

#who input[type="radio"]:checked + .label-text:before{
	content: "\f192";
	color: #8e44ad;
	animation: effect 250ms ease-in;
}

#who input[type="radio"]:disabled + .label-text{
	color: #aaa;
}

#who input[type="radio"]:disabled + .label-text:before{
	content: "\f111";
	color: #ccc;
}
@keyframes effect{
	0%{transform: scale(0);}
	25%{transform: scale(1.3);}
	75%{transform: scale(1.4);}
	100%{transform: scale(1);}
}

@import url('https://fonts.googleapis.com/css?family=Indie+Flower');
#location
{
	white-space: nowrap !important;
}
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>          
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


</head>
<body>
	<header class="major">
			<h2>글 남기기</h2>
		</header>
		<form action="saveWH.jsp">
		<div class="posts">
			<article id="who">
				<h3>누구랑 갔어?(갈거야?)</h3>
				<input type="text" name="whoWith" placeholder="공주들 모임/교회 모임" required><br>
				<div class="form-check">
					<label> 
						<input type="radio" name="whoNum" value="1" checked> 
						<span class="label-text">나 혼자</span>
					</label>
				</div>
				<div class="form-check">
					<label> 
						<input type="radio" name="whoNum" value="2"> 
						<span class="label-text">친구들</span>
					</label>
				</div>
				<div class="form-check">
					<label> 
						<input type="radio" name="whoNum" value="3"> 
						<span class="label-text">가족</span>
					</label>
				</div>
				<div class="form-check">
					<label> 
						<input type="radio" name="whoNum" value="4"> 
						<span class="label-text">연인</span>
					</label>
				</div>
				<div class="form-check">
					<label> 
						<input type="radio" name="whoNum" value="5"> 
						<span class="label-text">패키지 여행</span>
					</label>
				</div>
				<div class="form-check">
					<label> 
						<input type="radio" name="whoNum" value="6"> 
						<span class="label-text">기타</span>
					</label>
				</div>
			</article>
			<article id="when">
				<h3>언제 갔어?(갈거야?)</h3>
				<p>
				예를 들어, 기타 (교회 사람들)과
				</p>
				<div>
		        <label for="start">Start</label>
		        <input type="date" id="startDate" name="startDate" min="2017-01-01" max="2120-12-31">
		   		</div>
		    	<div>
		        	<label for="end">End</label>
		        	<input type="date" id="endDate" name="endDate" min="2017-01-01" max="2120-12-31" >
		    	</div>
			</article>
			<article id="where">
				<h3>어디로 갔어?(갈거야?)</h3>
				<div>
								<label for="country">Country</label>
                                <select id="country" name="country"></select>
                                <label for="region">Region</label>
                                <select id="region" name="region"></select>    
                                 <label for="city">City</label>
                                <select id="city" name="city"></select>
                        		<div id="location" ></div>
                        		<label for="whereTxt">세부사항</label><input type="text" id="whereTxt" name="whereTxt" placeholder="전주 한옥마을">
                        		<input type="hidden" id="loc" name="loc">   
				</div>
			</article>
			<article id="what">
				<h3>가서 무엇을 했어?(무엇을 할거야?)</h3>
					<textarea rows="4" cols="50" id="whatTxt" name="whatTxt" placeholder="알프스 소녀 하이디를 만나 치즈를 먹을거야"></textarea>
			</article>
			<article id="how">비행기 기차 버스 배 도보 자전거
				<h3>어떻게 갔니?(갈거니?)(교통수단)</h3>
					<label for="howAirplane">비행기</label>
					<label class="switch"> 
						<input type="radio" id="howAirplane" name="howAirplane" value="1"> <span class="slider round"></span>
					</label> 
					<label for="howTrain">기차</label>
					<label class="switch"> 
						<input type="radio" id="howTrain" name="howTrain" value="1"> <span class="slider round"></span>
					</label> 
					<label for="howBus">버스/자동차/지하철</label>
					<label class="switch"> 
						<input type="radio" id="howBus" name="howBus" value="1"> <span class="slider round"></span>
					</label> 
					<label for="howShip">배</label>
					<label class="switch"> 
						<input type="radio" id="howShip" name="howShip" value="1"> <span class="slider round"></span>
					</label> 
					<label for="howWalk">도보</label>
					<label class="switch"> 
						<input type="radio" id="howWalk" name="howWalk" value="1"> <span class="slider round"></span>
					</label> 
					<label for="howBike">자전거</label>
					<label class="switch"> 
						<input type="radio" id="howBike" name="howBike" value="1"> <span class="slider round"></span>
					</label> 
			</article>
			<article id="why">
				<h3>왜 갔어?(갈거야?)</h3>
					<input type="text" id="whyTxt" name="whyTxt" placeholder="가족여행, 결혼  20주년 기념">
				
			</article>
			<input type="submit">
			</div>
		</form>
		<script type="text/javascript">
		$(document).ready(function() {
			  //-------------------------------SELECT CASCADING-------------------------//
			  var selectedCountry = (selectedRegion = selectedCity = "");
			  // This is a demo API key for testing purposes. You should rather request your API key (free) from http://battuta.medunes.net/
			  var BATTUTA_KEY = "79a8fd8ced6ba90a222647faa32d6478";
			  // Populate country select box from battuta API
			  url =
			    "https://battuta.medunes.net/api/country/all/?key=" +
			    BATTUTA_KEY +
			    "&callback=?";

			  // EXTRACT JSON DATA.
			  $.getJSON(url, function(data) {
			    console.log(data);
			    $.each(data, function(index, value) {
			      // APPEND OR INSERT DATA TO SELECT ELEMENT.
			      $("#country").append(
			        '<option value="' + value.code + '">' + value.name + "</option>"
			      );
			    });
			  });
			  // Country selected --> update region list .
			  $("#country").change(function() {
			    selectedCountry = this.options[this.selectedIndex].text;
			    countryCode = $("#country").val();
			    // Populate country select box from battuta API
			    url =
			      "https://battuta.medunes.net/api/region/" +
			      countryCode +
			      "/all/?key=" +
			      BATTUTA_KEY +
			      "&callback=?";
			    $.getJSON(url, function(data) {
			      $("#region option").remove();
			      $('#region').append('<option value="">Please select your region</option>');
			      $.each(data, function(index, value) {
			        // APPEND OR INSERT DATA TO SELECT ELEMENT.
			        $("#region").append(
			          '<option value="' + value.region + '">' + value.region + "</option>"
			        );
			      });
			    });
			  });
			  // Region selected --> updated city list
			  $("#region").on("change", function() {
			    selectedRegion = this.options[this.selectedIndex].text;
			    // Populate country select box from battuta API
			    countryCode = $("#country").val();
			    region = $("#region").val();
			    url =
			      "https://battuta.medunes.net/api/city/" +
			      countryCode +
			      "/search/?region=" +
			      region +
			      "&key=" +
			      BATTUTA_KEY +
			      "&callback=?";
			    $.getJSON(url, function(data) {
			      console.log(data);
			      $("#city option").remove();
			      $('#city').append('<option value="">Please select your city</option>');
			      $.each(data, function(index, value) {
			        // APPEND OR INSERT DATA TO SELECT ELEMENT.
			        $("#city").append(
			          '<option value="' + value.city + '">' + value.city + "</option>"
			        );
			      });
			    });
			  });
			  // city selected --> update location string
			  $("#city").on("change", function() {
			    selectedCity = this.options[this.selectedIndex].text;
			    countryCode = $("#country").val();
			    region = $("#region").val();
			    city = $("#city").val();
			    url =
			      "https://battuta.medunes.net/api/city/" +
			      countryCode +
			      "/search/?region=" +
			      region +
			      "&city="+
			      city +
			      "&key=" +
			      BATTUTA_KEY +
			      "&callback=?";
			    $.getJSON(url, function(data) {
			      console.log(data);
			      $('#city').append('<option value="">Please select your city</option>');
			      $.each(data, function(index, value) {
			    	  $("#location").html(
						        selectedCountry +", " +
						        selectedRegion +", " +
						        selectedCity+"<br>" +
						        "<" + value.latitude+", "+value.longitude + ">"
						  );
			    	  $('#loc').val(value.latitude+", "+value.longitude);
			      });
			    });
			    
			  });
			});

		</script>
</body>
</html>