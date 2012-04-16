

 
<script type="text/javascript">	
	
	function placeMarker(id, pos,name,desc) {
		var marker = new google.maps.Marker({
			id : id,
			position : pos,
			title : id + name,
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
		id = "${fieldValue(bean: pointOfInterestInstance, field: "id")}"
		placeMarker(id, p, n, d);
	</script>
</g:each>