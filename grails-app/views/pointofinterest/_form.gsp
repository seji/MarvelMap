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

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'lat', 'error')} ">
	<label for="lat">
		<g:message code="pointOfInterest.lat.label" default="Lat" />
		
	</label>
	<g:textField name="lat" value="${pointOfInterestInstance?.lat}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'lng', 'error')} ">
	<label for="lng">
		<g:message code="pointOfInterest.lng.label" default="Lng" />
		
	</label>
	<g:textField name="lng" value="${pointOfInterestInstance?.lng}" />
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

