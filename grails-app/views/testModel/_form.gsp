<%@ page import="marvelmap.TestModel" %>



<div class="fieldcontain ${hasErrors(bean: testModelInstance, field: 'dateAdded', 'error')} required">
	<label for="dateAdded">
		<g:message code="testModel.dateAdded.label" default="Date Added" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${testModelInstance?.dateAdded}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: testModelInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="testModel.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${testModelInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testModelInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="testModel.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${testModelInstance?.name}"/>
</div>

