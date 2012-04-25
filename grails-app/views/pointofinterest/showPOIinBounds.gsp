

<script type="text/javascript">	

/*	
var infowindow = new google.maps.InfoWindow({
	//disableAutoPan : true,
	//content:  "id: "+ id +", name: "+ name +", rating: "+ rating
	content:  "marker"
	});
*/
function placeMarker(id,pos,name,desc,rating) {
	var marker = new google.maps.Marker({
		id : id,
		position : pos,
		title : "id: "+ id +", name: "+ name +", rating: "+ rating ,
		title : name,
		draggable : true,
		map : map
	});

	markersArray.push(marker);
	
	google.maps.event.addListener(marker, 'mouseover', function(event) {
		//infowindow
         });

	google.maps.event.addListener(marker, 'mouseout', function(event) {
		//alert('mouseout');
		//infowindow.close();
		//setTimeout(function () { this.infowindow.close(); }, 1000);
         });
    
	 google.maps.event.addListener(infowindow, 'domready', function() {
		 $("#info_window").dialog();                   
	    });
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.close();


			  $.get('/MarvelMap/PointOfInterest/showInfoWindow',
			     function(data){
			      infowindow.setContent(data);
			      
			    } );

			  //infowindow.setContent("id: "+ id +", name: "+ name +", rating: "+ rating);
			  infowindow.open(map, marker);	
				
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


