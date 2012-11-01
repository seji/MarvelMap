<style>
/*	#main_menu .ui-selecting { background: #FECA40; }*/
/*	#main_menu .ui-selected { background: #F39814; color: white; }*/
/*#main_menu ul:hover {
	background: #FECA40;
	color: white;
	className:ui-state-hover;
}*/

#main_menu {
	/*list-style-type: none;*/
	/*margin: 0.4em;*/
	/*padding: 0.4em;*/
	/*width: 100%;*/
}

#main_menu li {
	margin: 0 0 0.4em 0;
	padding: 0.4em;
	font-size: 1.2em;
	cursor:pointer;
	box-shadow: 5px 5px 10px #aaa;
	opacity:0.9;
}

/*	label,input {display: block;}
	input.text {margin-bottom: 12px;width: 95%;padding: .4em;}
	fieldset {padding: 0;border: 0;margin-top: 25px;}
*/
</style>

<script type="text/javascript">
$("li").hover(
		  function () {
			$(this).removeClass().addClass("ui-state-hover");
		  }, 
		  function () {
			$(this).removeClass().addClass("ui-state-default");
		  }
		);
</script>

<script type="text/javascript">
	$("#addPOI").click(function() {
		$.get('/MarvelMap/PointOfInterest/poiNew', function(data) {
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

<div id="main_menu">
		<li id="addPOI" class="ui-state-default">Add new Point of Interest</li>
		<li id="showList" class="ui-state-default">Show List</li>
		<li id="showAllPOI" class="ui-state-default">Show ALL POI on the map</li>
</div>