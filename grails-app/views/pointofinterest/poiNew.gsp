<%@ page import="marvelmap.PointOfInterest" %>
<g:set var="entityName" value="${message(code: 'pointOfInterest.label', default: 'PointOfInterest')}" />
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
			height : 500,
			width : 500,
			modal : true,
			resizable : false,
			draggable : false,
/*			buttons : {
				"Create Point of Interest" : function() {
					//alert(clickLocation);
					$.get('/MarvelMap/PointOfInterest/save');
					//				alert(clickLocation);
			
					$(this).dialog("close");
					 				},
				"Cancel" : function() {
					$(this).dialog("close");
				}
			}*/
		});
	});
</script>

<div id="dialog-form" title="Create new Point of Interest">
	<g:form action="save" >
		<fieldset>
			<label for="test">${pointOfInterestInstance?.toString() }</label>
			<label for="poiName">Enter Point of Interest name</label> 
			<input type="text" name="poiName" id="poiName" value="${pointOfInterestInstance?.name}" class="text ui-widget-content ui-corner-all" /> 
			<label for="poiDesc">Enter your description</label> 
			<input type="text" name="poiDesc" id="poiDesc" value="${pointOfInterestInstance?.description}" class="text ui-widget-content ui-corner-all" />
			<g:textField name="description" value="${pointOfInterestInstance?.description}" class="text ui-widget-content ui-corner-all" />
			<fieldset class="buttons">
					<g:submitButton name="create"  value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			
			<script>document.write(variable)</script>
		</fieldset>
	</g:form>
</div>



