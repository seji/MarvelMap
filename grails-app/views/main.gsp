<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"
	charset='utf-8' />
<META HTTP-EQUIV="EXPIRES" CONTENT="-1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">


<title>Marvel Map 0.1</title>



<style type="text/css">


html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0;
	font-size: 90%;

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
	
<link rel="stylesheet" href="${resource(dir: 'css', file: 'context_menu.css')}"	type="text/css">

<script type="text/javascript"
	src="${resource(dir: 'js', file: 'context_menu.js')}"></script>
	
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'spin.js')}"></script>
	
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery.spin.js')}"></script>
	
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'marvelmap.js')}"></script>

<script type="text/javascript"
	src="${resource(dir: 'js', file: 'flipcounter.js')}"></script>	
	

	
</head>

<body onload="initialize()">


<!--  	<div id="dialog-message">
		<p>Welcome screen</p>
	</div>-->
	
	<div id="map_canvas" style="width: 100%; height: 100%"></div>



</body>

</html>