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

<script type="text/javascript"
	src="${resource(dir: 'js', file: 'context_menu.js')}"></script>

<!--<script type="text/javascript">
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
</script>-->

<script type="text/javascript">
	function initialize() {
		var myOptions = {
			center : new google.maps.LatLng(10, -10),
			zoom : 13,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
		};

		//create map
		map = new google.maps.Map(document.getElementById("map_canvas"),
				myOptions);

		//initialize infowindow
		infowindow = new google.maps.InfoWindow({
			//disableAutoPan : true,
			//content:  "id: "+ id +", name: "+ name +", rating: "+ rating
			//content : "marker"
		});

		google.maps.event.addListener(map, 'rightclick', function(event) {
			clickLocation = event.latLng;
			clickZoom = map.getZoom();

			$.get('/MarvelMap/PointOfInterest/menu', function(data) {
				$('.contextMenu').html(data);
			});
		});

		google.maps.event.addListener(infowindow, 'domready', function() {

			 //$("#info_window").dialog();
			//infowindow.setContent("new content"+rating);
		                    
		 });
		 
		markersArray = [];

		function clearOverlays() {
			if (markersArray) {
				for ( var i = 0; i < markersArray.length; i++) {
					markersArray[i].setMap(null);
				}
			}
		}

		function showPOIinBounds(){
			setTimeout(function() {
				//clear existing markers from the map
				clearOverlays();
				// clear markers array
				markersArray = [];
				//show all POIs within current bounds
				$.post('/MarvelMap/PointOfInterest/showPOIinBounds', {
					NElat : map.getBounds().getNorthEast().lat(),
					NElng : map.getBounds().getNorthEast().lng(),
					SWlat : map.getBounds().getSouthWest().lat(),
					SWlng : map.getBounds().getSouthWest().lng()
				}, function(data) {
					$('.contextMenu').html(data);
				});
			}, 500);

			}

		
		$.each('open dragend zoom_changed'.split(' '), function(i, name) {
			google.maps.event.addListener(map, name, function() {
				showPOIinBounds();
			});
		});

		/*
		 * Create the menu and attached it to the map
		 */
		context_menu = new contextMenu({
			map : map
		});

	}// end initialize
</script>

</head>
<body onload="initialize()">


	<!--<div id="dialog-message">
		<p>Welcome screen</p>
	</div>-->
	<div id="map_canvas" style="width: 100%; height: 100%"></div>



</body>

</html>