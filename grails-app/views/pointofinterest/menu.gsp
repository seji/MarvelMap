<div id="test">
<ul>
	<li id="addPOI"> Add POI</li>
</ul>


<div id="test2">hello world !</div>

<div>
<form action="">
	<input type="text" />
</form>
</div>

</div>
<script type="text/javascript">
$(document).ready(	function() {
	$("#addPOI").click(function() {
			$.get('http://localhost:8080/MarvelMap/PointOfInterest/poiNew',	function(data) {
				$('.contextMenu').html(data);
				//alert(clickLocation);
			});
	});
});
</script>

