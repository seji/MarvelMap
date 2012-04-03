<style>
/*body { font-size: 62.5%; }*/
label,input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}
</style>
<script type="text/javascript">


	$(function() {
		$("#dialog-form").dialog(
				{
					autoOpen : true,
					height : 400,
					width : 500,
					modal : true,
					resizable : false,
					draggable : false,
					buttons : {
						"Create" : function() {
							//var my_form = $('form').serialize();
							//document.write(my_form);
							document.getElementById('lat').value=clickLocation.lat();
							document.getElementById('lng').value=clickLocation.lng();
							document.getElementById('zoom').value=clickZoom.toString();
							
							$.post('/MarvelMap/PointOfInterest/save', $('form').serialize(), 
									function(data) {
									
										$('.contextMenu').html(data);
										$('form').empty();//Clear form data
									}
							);
							$(this).dialog("close");
						},
						"Cancel" : function() {
							$(this).dialog("close");
							$('form').empty();//Clear form data
						}
					}
				});
	});
</script>

<div id="dialog-form" title="Create new Point of Interest">
	<g:form action="save">
		<fieldset>
			<label for="poiName">Enter Point of Interest name</label>
			<g:textField name="name" maxlength="100" class="text ui-widget-content ui-corner-all" />
			<label for="poiDesc">Enter your description</label>
			<g:textField name="description"	maxlength="140" class="text ui-widget-content ui-corner-all" />

			<!-- <g:textArea name="description" rows="5" cols="40"  /> -->
			
			<g:hiddenField type="hidden" name="lat" id="lat" value=""/>
			<g:hiddenField type="hidden" name="lng" id="lng" value=""/>
			<g:hiddenField type="hidden" name="zoom" id="zoom" value=""/>

		</fieldset>
	</g:form>
</div>



