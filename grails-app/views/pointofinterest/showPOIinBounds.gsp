
<g:each in="${poiToShowlist}" status="i" var="pointOfInterestInstance">
	<script type="text/javascript">	
		var p = new google.maps.LatLng(${fieldValue(bean: pointOfInterestInstance, field: "lat")},${fieldValue(bean: pointOfInterestInstance, field: "lng")});
		var n = "${fieldValue(bean: pointOfInterestInstance, field: "name")}"
		var d = "${fieldValue(bean: pointOfInterestInstance, field: "description")}"
		var id = "${fieldValue(bean: pointOfInterestInstance, field: "id")}"
		var r = "${fieldValue(bean: pointOfInterestInstance, field: "rating")}"		
		placeMarker(id, p, n, d, r, false);
	</script>
</g:each>


