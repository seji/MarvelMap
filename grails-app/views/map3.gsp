<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"
	charset='utf-8' />
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
<!--  -->
<script type="text/javascript" src="${resource(dir: 'js', file: 'context_menu.js')}"></script>

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
			//mapZoom = map.getZoom();
			startLocation = event.latLng;
			//iw.open(map, marker2);
			placeMarker(startLocation);
			//$(function() {alert('Message');});
			//var contextMenu = $('#contextMenu');
/*			$.get('http://localhost:8080/MarvelMap/Test_menu', function(data) {
				  $('.result').html(data);
				  alert('Load was performed.');
				});
*/
		});

		function placeMarker(pos) {
			var marker = new google.maps.Marker({
				//position : new google.maps.LatLng(10, -10.1),
				position : pos,
				title : "Езжай сюды!",
				draggable : true,
				map : map
			});

			//iw.open(map, marker);
		}

		var iw = new google.maps.InfoWindow({
			content : "Езжай сюды!"
		});
		//placeMarker();

		/**
		 * Create the menu and attached it to the map
		 */
		var menu = new contextMenu({
			map : map
		});

		// Add some items to the menu
		menu.addItem('Zoom In', function(map, latLng) {
			map.setZoom(map.getZoom() + 1);
			map.panTo(latLng);
		});

		menu.addItem('Zoom Out', function(map, latLng) {
			map.setZoom(map.getZoom() - 1);
			map.panTo(latLng);
		});

		//menu.addSep();

		menu.addItem('Center Here', function(map, latLng) {
			map.panTo(latLng);
		});

	} // end initialize
</script>

</head>
<body onload="initialize()">

	<div id="map_canvas" style="width: 100%; height: 100%"></div>




</body>
</html>