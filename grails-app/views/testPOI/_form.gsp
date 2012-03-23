<%@ page import="marvelmap.TestPOI" %>



<div class="fieldcontain ${hasErrors(bean: testPOIInstance, field: 'dateAdded', 'error')} required">
	<label for="dateAdded">
		<g:message code="testPOI.dateAdded.label" default="Date Added" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${testPOIInstance?.dateAdded}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: testPOIInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="testPOI.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${testPOIInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testPOIInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="testPOI.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${testPOIInstance?.name}"/>
</div>

