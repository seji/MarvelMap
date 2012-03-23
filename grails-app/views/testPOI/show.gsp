
<%@ page import="marvelmap.TestPOI" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'testPOI.label', default: 'TestPOI')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-testPOI" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-testPOI" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list testPOI">
			
				<g:if test="${testPOIInstance?.dateAdded}">
				<li class="fieldcontain">
					<span id="dateAdded-label" class="property-label"><g:message code="testPOI.dateAdded.label" default="Date Added" /></span>
					
						<span class="property-value" aria-labelledby="dateAdded-label"><g:formatDate date="${testPOIInstance?.dateAdded}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${testPOIInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="testPOI.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${testPOIInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testPOIInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="testPOI.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${testPOIInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${testPOIInstance?.id}" />
					<g:link class="edit" action="edit" id="${testPOIInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
