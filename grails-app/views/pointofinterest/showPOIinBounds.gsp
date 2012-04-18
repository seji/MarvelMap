

<script type="text/javascript">	

	
var infowindow

function placeMarker(id,pos,name,desc,rating) {
	var marker = new google.maps.Marker({
		id : id,
		position : pos,
		title : "id: "+ id +", name: "+ name +", rating: "+ rating ,
		draggable : true,
		map : map
	});

	google.maps.event.addListener(marker, 'mouseover', function(event) {
		infowindow = new google.maps.InfoWindow({
			content:  'Hello world'
			});
	    	//infowindow.content = $.get('/MarvelMap/PointOfInterest/showInfoWindow');
			infowindow.open(map, marker);


			//map.setZoom(8);
	    //map.setCenter(marker.getPosition());
        //this.setIcon("http://xxx.de/test6/system/css/images/pfote_clean.png");
         });

	google.maps.event.addListener(marker, 'mouseout', function(event) {
		//alert('mouseout');
		infowindow.close();
         });
    

	google.maps.event.addListener(marker, 'click', function() {
		
               
	  });
}
</script>
<g:each in="${threePOIlist}" status="i" var="pointOfInterestInstance">
	<script type="text/javascript">	
		p = new google.maps.LatLng(${fieldValue(bean: pointOfInterestInstance, field: "lat")},${fieldValue(bean: pointOfInterestInstance, field: "lng")});
		n = "${fieldValue(bean: pointOfInterestInstance, field: "name")}"
		d = "${fieldValue(bean: pointOfInterestInstance, field: "description")}"
		id = "${fieldValue(bean: pointOfInterestInstance, field: "id")}"
		r = "${fieldValue(bean: pointOfInterestInstance, field: "rating")}"		
		placeMarker(id, p, n, d, r);
		
	</script>
</g:each>