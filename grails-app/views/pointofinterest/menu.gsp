<style>
/*	#test .ui-selecting { background: #FECA40; }*/
/*	#test .ui-selected { background: #F39814; color: white; }*/
#test ul:hover {
	background: #FECA40;
	color: white;
}

#test {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 100%;
}

#test li {
	margin: 3px;
	padding: 0.4em;
	font-size: 1.2em;
	height: 18px;
}

/*	label,input {display: block;}
	input.text {margin-bottom: 12px;width: 95%;padding: .4em;}
	fieldset {padding: 0;border: 0;margin-top: 25px;}
*/
</style>
<script>
	$(function() {
		$("#test").selectable();
	});
</script>

<script type="text/javascript">
	$("#addPOI").click(function() {
		$.get('/MarvelMap/PointOfInterest/poiNew', function(data) {
			$('.contextMenu').html(data);
		});
	});
</script>

<script type="text/javascript">
	$("#lookAround").click(function() {
		$.get('/MarvelMap/PointOfInterest/create', function(data) {
			$('.contextMenu').html(data);
		});
	});
</script>
<script type="text/javascript">
	$("#showList").click(function() {
		$.get('/MarvelMap/PointOfInterest/list', function(data) {
			$('.contextMenu').html(data);
		});
	});
</script>

<script type="text/javascript">
	$("#showAllPOI").click(function() {
		$.get('/MarvelMap/PointOfInterest/showAllPOI', function(data) {
			$('.contextMenu').html(data);
		});
	});
</script>

<script type="text/javascript">
	$("#removeAllPOI").click(function() {
		$.get('/MarvelMap/PointOfInterest/removeAllPOI', function(data) {
			$('.contextMenu').html(data);
		});
	});
</script>


<script type="text/javascript">
	$("#showPOIinBounds").click(function() {
		$.post('/MarvelMap/PointOfInterest/showPOIinBounds', {
			NElat : map.getBounds().getNorthEast().lat(),
			NElng : map.getBounds().getNorthEast().lng(),
			SWlat : map.getBounds().getSouthWest().lat(),
			SWlng : map.getBounds().getSouthWest().lng()
		}, function(data) {
			$('.contextMenu').html(data);
		});
	});
</script>


<div id="test">
	<ul>
		<li id="addPOI">Add new Point of Interest</li>
	</ul>
	<ul>
		<li id="lookAround">Create</li>
	</ul>
	<ul>
		<li id="showList">Show List</li>
	</ul>
	<ul>
		<li id="showAllPOI">Show ALL POI on the map</li>
	</ul>
	<ul>
		<li id="removeAllPOI">Remove ALL POI from the map</li>
	</ul>
	<ul>
		<li id="showPOIinBounds">Show POI that fit the current screen</li>
	</ul>
</div>