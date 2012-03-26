<style>
/*	#test .ui-selecting { background: #FECA40; }*/
/*	#test .ui-selected { background: #F39814; color: white; }*/
	#test ul:hover { background: #FECA40; color: white;} 
	#test {list-style-type: none; margin: 0; padding: 0; width: 100%;}
	#test li {margin: 3px; padding: 0.4em; font-size: 1.2em; height: 18px; }
	
/*	label,input {display: block;}
	input.text {margin-bottom: 12px;width: 95%;padding: .4em;}
	fieldset {padding: 0;border: 0;margin-top: 25px;}
*/
</style>	
	<script>
	$(function() {
		$( "#test" ).selectable();
	});
	</script>

<script type="text/javascript">
	$("#addPOI").click(function() {
			$.get('http://localhost:8080/MarvelMap/PointOfInterest/poiNew',	function(data) {
				$('.contextMenu').html(data);
//				alert(clickLocation);
			});
	});
</script>

<div id="test">
	<ul>
		<li id="addPOI">Add new Point of Interest</li>
	</ul>
	<ul>
		<li id="addPOI">Look what's around</li>
	</ul>
</div>