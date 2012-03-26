<%@ page import="marvelmap.PointOfInterest" %>



<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'dateAdded', 'error')} required">
	<label for="dateAdded">
		<g:message code="pointOfInterest.dateAdded.label" default="Date Added" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${pointOfInterestInstance?.dateAdded}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="pointOfInterest.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${pointOfInterestInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointOfInterestInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="pointOfInterest.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${pointOfInterestInstance?.name}"/>
</div>

