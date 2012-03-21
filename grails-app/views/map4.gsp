<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"
	charset='utf-8' />

<META HTTP-EQUIV="EXPIRES" CONTENT="-1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">


<title>Marvel Map 0.1</title>

<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'context_menu.css')}"
	type="text/css">

<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

#map_canvas {
	height: 100%
}
</style>

<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCEevZNwXfSdSvUSsC72_nmEkD4QXRBopg&sensor=false"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>

<link rel="stylesheet"
	href="${resource(dir: 'css/ui-lightness', file: 'jquery-ui-1.8.18.custom.css')}"
	type="text/css">

<!--  -->
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'context_menu.js')}"></script>

<script type="text/javascript">
$(function() {
	// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
	$( "#dialog:ui-dialog" ).dialog( "destroy" );

	$( "#dialog-message" ).dialog({
		modal: true,
		title : "Marvel Map",
		draggable : false,
		resizable : false,
	
		buttons: {
			
			"Start!": function() {
				$( this ).dialog( "close" );
			}
		}
	});
});
</script>



<script type="text/javascript">
	var location;

	function initialize() {
		var myOptions = {
			center : new google.maps.LatLng(10, -10),
			zoom : 4,
			mapTypeId : google.maps.MapTypeId.ROADMAP,

		};
		var map = new google.maps.Map(document.getElementById("map_canvas"),
				myOptions);

		google.maps.event.addListener(map, 'rightclick', function(event) {
			clickLocation = event.latLng;

			//make location global variable
			window.clickLocation = clickLocation;

			$.get('http://localhost:8080/MarvelMap/PointOfInterest/menu',
					function(data) {
						//				alert(clickLocation);
						$('.contextMenu').html(data);
					});

		});

		/*
		 * Create the menu and attached it to the map
		 */
		var context_menu = new contextMenu({
			map : map
		});

	} // end initialize
</script>

</head>
<body onload="initialize()">
	<div id="dialog-message">
		<p>Здорово чувак!!!</p> <p>Не знаешь куда поехать?</p> <p>Щас узнаешь!!!</p>
		
	</div>
	<div id="map_canvas" style="width: 100%; height: 100%"></div>


</body>
</html>