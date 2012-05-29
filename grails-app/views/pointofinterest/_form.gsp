<%@ page import="marvelmap.PointOfInterest" %>



<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'dateAdded', 'error')} ">
	<label for="dateAdded">
		<g:message code="pointOfInterest.dateAdded.label" default="Date Added" />
		
	</label>
	<g:datePicker name="dateAdded" precision="day" value="${pointOfInterestInstance?.dateAdded}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="pointOfInterest.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${pointOfInterestInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'imageURL', 'error')} ">
	<label for="imageURL">
		<g:message code="pointOfInterest.imageURL.label" default="Image URL" />
		
	</label>
	<g:textField name="imageURL" value="${pointOfInterestInstance?.imageURL}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'lat', 'error')} ">
	<label for="lat">
		<g:message code="pointOfInterest.lat.label" default="Lat" />
		
	</label>
	<g:field type="number" name="lat" value="${fieldValue(bean: pointOfInterestInstance, field: 'lat')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'lng', 'error')} ">
	<label for="lng">
		<g:message code="pointOfInterest.lng.label" default="Lng" />
		
	</label>
	<g:field type="number" name="lng" value="${fieldValue(bean: pointOfInterestInstance, field: 'lng')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="pointOfInterest.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${pointOfInterestInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'rating', 'error')} ">
	<label for="rating">
		<g:message code="pointOfInterest.rating.label" default="Rating" />
		
	</label>
	<g:field type="number" name="rating" value="${fieldValue(bean: pointOfInterestInstance, field: 'rating')}" />
</div>

