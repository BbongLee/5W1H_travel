$("document").ready(function()
{
	$('select').material_select();
	$(".button-collapse").sideNav();
	$("#success-modal").modal();
	//------------------------- HELPER FUNCTIONS -----------------------------//

	var showProgressBar=function()
	{
		//If the progress bar has already been created, then just show it
		if($("#form-progress").length)
		{
			$("#form-progress").show();
		}
		// else, create it
		else
		{
			$("#progress-container").append('<div id="form-progress" class="progress">');
			$("#form-progress").append('<div class="indeterminate">');
		}
	};
	var resetForm=function()
	{
		//If the progress bar has already been created, then just show it
		$("#form-errors").empty();
		if($("#form-progress").length)
		{
			$("#form-progress").hide();
		}
		// else, create it
		$("form").trigger("reset");
		grecaptcha.reset();
	};
	var showErrors=function(errors)
	{
		if(errors!==undefined && errors!==[])
		{
			$("#form-errors").text("");
			$("#form-errors").append("<ul>");
			$.each(errors,function(errorTitle,errorContent)
			{
				$("<li>").text(errorContent)
						 .addClass("red-text red lighten-4")
						 .appendTo($("#form-errors ul"));
			});
		}
	};

	//------------------------- END OF HELPER FUNCTIONS ----------------------//

	//------------------------- SMOOTH SCROLL--------------------------------//
    
    // Add smooth scrolling to all links in navbar + footer link
    $('a[href="#about"],a[href="#usage"],a[href="#show-case"],a[href="#signup"],a[href="#contact"]').click(function(e)
    {
		e.preventDefault();
	    $('html, body').animate(
	    {
	        scrollTop: $($.attr(this, 'href')).offset().top-60
	    }, 800);
	});
	//-------------------------END OF SMOOTH SCROLL--------------------------------//
    
    //-------------------------------SIGNUP FORM-------------------------//

	$("form").on("submit",function(e)
	{
		e.preventDefault();
		showProgressBar();
		$.ajax(
		{
			type:$("form").attr("method"),
			url:$("form").attr("action"),
			data:$("form").serialize()
		})
		.done(function(response)
		{
			
			if (typeof response.data !== 'undefined') 
			{
				$("#success-modal").modal("open");
            }
         	resetForm();
		})
		.fail(function(jqXHR, textStatus,errorThrown)
		{

            if (typeof jqXHR.responseJSON !== 'undefined') 
            {
                if (jqXHR.responseJSON.hasOwnProperty('form')) 
                {
                    showErrors(jqXHR.responseJSON.form);
               }
                showErrors(jqXHR.responseJSON.data);
            } 
            else 
            {
                alert(errorThrown);
            }
            $("#form-progress").hide();

		});
	});

	//-------------------------------END OF SIGNUP FORM-------------------------//
 
 	//-------------------------------SELECT CASCADING-------------------------//
  	var currentCities=[];
  	var BATTUTA_KEY="00000000000000000000000000000000"
  	// Populate country select box from battuta API
	url="https://battuta.medunes.net/api/country/all/?key="+BATTUTA_KEY+"&callback=?";
  	$.getJSON(url,function(countries)
  	{
  		 $('#country').material_select();
	    //loop through countries..
	    $.each(countries,function(key,country)
	    {
	        $("<option></option>")
	         				.attr("value",country.code)
	         				.append(country.name)
	                     	.appendTo($("#country"));
	       
	    }); 
	    // trigger "change" to fire the #state section update process
	    $("#country").material_select('update');
	    $("#country").trigger("change");
	    

  	});
    
    $("#country").on("change",function()
  	{
  	
  		countryCode=$("#country").val();
  		
  		// Populate country select box from battuta API
	    url="https://battuta.medunes.net/api/region/"
	    +countryCode
	    +"/all/?key="+BATTUTA_KEY+"&callback=?";

  		$.getJSON(url,function(regions)
  		{
  			$("#region option").remove();
		    //loop through regions..
		    $.each(regions,function(key,region)
		    {
		        $("<option></option>")
		         				.attr("value",region.region)
		         				.append(region.region)
		                     	.appendTo($("#region"));
		    });
		    // trigger "change" to fire the #state section update process
	    	$("#region").material_select('update');
	    	$("#region").trigger("change");
	    	
	    }); 
	    
  	});
  	$("#region").on("change",function()
  	{
  		
  		// Populate country select box from battuta API
  		countryCode=$("#country").val();
		region=$("#region").val();
	    url="https://battuta.medunes.net/api/city/"
	    +countryCode
	    +"/search/?region="
	    +region
	    +"&key="
	    +BATTUTA_KEY
	    +"&callback=?";
  		
  		$.getJSON(url,function(cities)
  		{
  			currentCities=cities;
        	var i=0;
        	$("#city option").remove();
        
		    //loop through regions..
		    $.each(cities,function(key,city)
		    {
		        $("<option></option>")
		         				.attr("value",i++)
		         				.append(city.city)
		                .appendTo($("#city"));
		    });
		    // trigger "change" to fire the #state section update process
	    	$("#city").material_select('update');
	    	$("#city").trigger("change");
	    	
	    }); 
	    
  	});	
  	$("#city").on("change",function()
  	{
      currentIndex=$("#city").val();
      currentCity=currentCities[currentIndex];
      city=currentCity.city;
      region=currentCity.region;
      country=currentCity.country;
      lat=currentCity.latitude;
      lng=currentCity.longitude;
      $("#location").html('<i class="fa fa-map-marker"></i> <strong> '+city+"/"+region+"</strong>("+lat+","+lng+")");
    });
   //-------------------------------END OF SELECT CASCADING-------------------------//
});