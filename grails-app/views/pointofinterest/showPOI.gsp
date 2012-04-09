


<script type="text/javascript">	
	
	function placeMarker(pos) {
		var marker = new google.maps.Marker({
			position : pos,
			title : "Езжай сюды!",
			draggable : true,
			map : map
		});
	}

	//alert(${lat});
	//alert(${lng});
	
	//p = new google.maps.LatLng(${lat},${lng});
	//alert(p);
	//placeMarker(p);

	//placeMarker(clickLocation);
</script>

<g:each var="i" in="{(0..3)}" >
	<script type="text/javascript">
	alert(${lat});
	
	</script>
	
</g:each>