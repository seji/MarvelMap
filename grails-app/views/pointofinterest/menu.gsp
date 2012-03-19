
<ul>
	<li id="addPOI">Add POI</li>
</ul>

<div>

	hello world !

	<div>

		<form action="">
			<input type="text" />
		</form>

	</div>

</div>
<script type="text/javascript">
$(document).ready(	function() {
	$("#addPOI").click(function() {
	// alert('click');
		$.get('http://localhost:8080/MarvelMap/PointOfInterest/poiNew',	function(data) {
			$('.contextMenu').html(data);
			});
	});
});
</script>