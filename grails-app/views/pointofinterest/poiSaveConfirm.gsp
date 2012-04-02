<script type="text/javascript">
$(function() {
	$( "#dialog-message" ).dialog({
		modal: true,
		title : "Marvel Map",
		draggable : false,
		resizable : false,
		buttons: {
			"OK": function() {
				$( this ).dialog( "close" );
				//location.reload();
				//window.location.reload(true);
			}
		}
	});
});
</script>

<div id="dialog-message">
		<p>Your new Point of Interest has been saved successfully!</p>
		
	</div>