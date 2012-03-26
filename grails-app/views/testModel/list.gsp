
<%@ page import="marvelmap.TestModel" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'testModel.label', default: 'TestModel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-testModel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-testModel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateAdded" title="${message(code: 'testModel.dateAdded.label', default: 'Date Added')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'testModel.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'testModel.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${testModelInstanceList}" status="i" var="testModelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${testModelInstance.id}">${fieldValue(bean: testModelInstance, field: "dateAdded")}</g:link></td>
					
						<td>${fieldValue(bean: testModelInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: testModelInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${testModelInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
