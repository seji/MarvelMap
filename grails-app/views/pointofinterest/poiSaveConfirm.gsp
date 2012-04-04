<script type="text/javascript">
$(function() {

	function placeMarker(pos) {
		var marker = new google.maps.Marker({
			position : pos,
			title : "Езжай сюды!",
			draggable : true,
			map : map
		});
	}


	
	$( "#dialog-message" ).dialog({
		modal: true,
		title : "Marvel Map",
		draggable : false,
		resizable : false,
		buttons: {
			"OK": function() {
				placeMarker(clickLocation);
				
				$( this ).dialog( "close" );
			}
		}
	});
});
</script>

<div id="dialog-message">
		<p>Your new Point of Interest has been saved successfully!</p>
		
	</div>