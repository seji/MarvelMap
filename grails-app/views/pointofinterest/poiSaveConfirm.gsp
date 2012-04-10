<script type="text/javascript">
$(function() {
	$( "#dialog-message" ).dialog({
		modal: true,
		title : "Marvel Map",
		draggable : false,
		resizable : false,
		buttons: {
			"OK": function() {

				$.get('/MarvelMap/PointOfInterest/showPOI', function(data) {
					$('.contextMenu').html(data);
				});
				
				$( this ).dialog( "close" );
			}
		}
	});
});
</script>

<div id="dialog-message">
		<p>Your new Point of Interest has been saved successfully!</p>
		
	</div>