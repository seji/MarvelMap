

 
<script type="text/javascript">	
	
	function placeMarker(pos,name,desc) {
		var marker = new google.maps.Marker({
			position : pos,
			title : name,
			draggable : true,
			map : map
		});
	}
</script>

<g:each in="${pointOfInterestInstanceList}" status="i"	var="pointOfInterestInstance">
	<script type="text/javascript">	
		p = new google.maps.LatLng(${fieldValue(bean: pointOfInterestInstance, field: "lat")},${fieldValue(bean: pointOfInterestInstance, field: "lng")});
		n = "${fieldValue(bean: pointOfInterestInstance, field: "name")}"
		d = "${fieldValue(bean: pointOfInterestInstance, field: "description")}"
		placeMarker(p, n, d);
	</script>
</g:each>