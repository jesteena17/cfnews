<style type="text/css">
  #map_canvas { width: 400px; height: 450px; }
</style>
<body onload="initialize()">
    <cfoutput>
        <form method="post">
            <input type="text" name="t1" id="t1" value="Thiruvananthapuram, IN" placeholder="Thiruvananthapuram, IN"/>
            <input type="submit" name="sub" value="search"/>
        </form>
        <cfset lat=10.8505/>
        <cfset lon =76.2711/>
        <cfif structkeyexists(form,"sub")>
            <cfdump var=#DatetimeFormat(now(),"mmm d, hh:mm tt")#/>
            Your Searched for the weather in  "<cfdump var=#form.t1#/>"
            <cfhttp method="get" url="https://api.openweathermap.org/data/2.5/weather?q=Trivandrum,%20IN&appid=b37be377dadc93ffc8cce2d361766b5e" charset="utf-8" result="result"></cfhttp>
            <cfset  r=#deserializeJSON(result.Filecontent)#/>
            <cfdump var=#r#/>
            <p>Temperature :#round(r.main.temp-273.15)# deg Celsius</p>
            <p>Feels Like Temperature :#round(r.main.feels_like-273.15)&'deg Celsius , '&r.weather[1].main&','&r.weather[1].description#</p>
            <p>wind speed:  #r.wind.speed&'m/s NW '&'&nbsp; pressure : '&r.main.pressure&'hPa'# </p>
            <p>Humidity :#r.main.humidity&'%'# </p>
            <cfset lat=r.coord.lat/>
            <cfset lon =r.coord.lon/>
            <div id="map_canvas"></div>
        <cfelse>
            <cfdump var="No Input Found"/>
        </cfif>
    </cfoutput>
</body>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
function initialize() {
	var latlng = new google.maps.LatLng(<cfoutput>#lat#</cfoutput>,<cfoutput>#lon#</cfoutput>);
	var myOptions = {
		zoom: 8,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
}
</script>