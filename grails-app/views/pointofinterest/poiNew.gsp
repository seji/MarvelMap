<style>
/*body { font-size: 62.5%; }*/
label,input {display: block;}
input.text {margin-bottom: 12px;width: 95%;padding: .4em;}
fieldset {padding: 0;border: 0;margin-top: 25px;}

</style>
<script type="text/javascript">
	$(function() {
		$("#dialog-form").dialog({
			autoOpen : true,
			height : 400,
			width : 500,
			modal : true,
			resizable : false,
			draggable : false,
			buttons : {
				"Create Point of Interest" : function() {
					//alert(clickLocation);
//					$.get('/MarvelMap/PointOfInterest/save');
					$.post('/MarvelMap/PointOfInterest/save',$('form').serialize());
					//				alert(clickLocation);
			
					//$(this).dialog("close");
					 				},
				"Cancel" : function() {
					$(this).dialog("close");
				}
			}
		});
	});
</script>

<div id="dialog-form" title="Create new Point of Interest">
	<g:form action="save">
		<fieldset>
			<label for="poiName">Enter Point of Interest name</label> 
			<g:textField name="name" value="${pointOfInterestInstance?.name}" class="text ui-widget-content ui-corner-all" />

			<label for="poiDesc">Enter your description</label> 
			<g:textField name="description" value="${pointOfInterestInstance?.description}" class="text ui-widget-content ui-corner-all" />
						
<!--  			<script>document.write(variable)</script> -->
		</fieldset>
	</g:form>
</div>



