

 
<script type="text/javascript">	
	
	function placeMarker(id, pos,name,desc) {
		 var marker = new google.maps.Marker({
			id : id,
			position : pos,
			title : id + name,
			draggable : true,
			map : map
		});
		 google.maps.event.addListener(marker, "mouseover", function(event) {
		        //this.setIcon("http://xxx.de/test6/system/css/images/pfote_clean.png");
		        alert("mouseover");
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