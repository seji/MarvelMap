<g:each in="${threePOIlist}" status="i" var="pointOfInterestInstance">
	<script type="text/javascript">	
		//var id = "${fieldValue(bean: pointOfInterestInstance, field: "id")}";
		//alert(id);				
	</script>
	
	<label for="poiName">"${fieldValue(bean: pointOfInterestInstance, field: "id")}"</label>
</g:each>

<div id="info_window" title="Info window">
	<g:form action="rating">
		<fieldset>
			<label for="poiName">Enter Point of Interest name</label>
			<g:textField name="name" maxlength="100" value = "${fieldValue(bean: pointOfInterestInstance, field: "id")}"/>
			<ul></ul> 
			<label for="poiDesc">Enter your description</label>
			<g:textField name="description"	maxlength="140" />
		</fieldset>
	</g:form>
</div>

