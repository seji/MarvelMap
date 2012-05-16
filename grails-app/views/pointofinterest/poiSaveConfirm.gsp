<script type="text/javascript">
	var p = new google.maps.LatLng(${fieldValue(bean: poi, field: "lat")},${fieldValue(bean: poi, field: "lng")});
	var n = "${fieldValue(bean: poi, field: "name")}"
	var d = "${fieldValue(bean: poi, field: "description")}"
	var id = "${fieldValue(bean: poi, field: "id")}"
	var r = "${fieldValue(bean: poi, field: "rating")}"
	newPOISaveConfirm();

</script>

<div id="dialog-message">
		<p>Your new Point of Interest has been saved successfully!</p>
		
	</div>