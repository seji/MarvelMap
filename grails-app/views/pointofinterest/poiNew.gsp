<!DOCTYPE html>
<style>
body { font-size: 90%; }
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
<script src="http://www.google.com/jsapi" type="text/javascript"></script>

<script type="text/javascript">
	newPOIDialog();
</script>


<div id="new_POI_dialog" title="Create new Point of Interest">
	<g:form action="save">
		<fieldset>
			<label for="poiName">Enter Point of Interest name</label>
			<g:textField name="name" maxlength="100" class="text ui-widget-content ui-corner-all" />
			<label for="poiDesc">Enter your description</label>
			<g:textField name="description"	maxlength="500" class="text ui-widget-content ui-corner-all" />

			<!-- <g:textArea name="description" rows="5" cols="40"  /> -->
			
			<g:hiddenField type="hidden" name="lat" id="lat" value=""/>
			<g:hiddenField type="hidden" name="lng" id="lng" value=""/>
			<g:hiddenField type="hidden" name="zoom" id="zoom" value=""/>
			

	

		</fieldset>
	</g:form>
</div>




