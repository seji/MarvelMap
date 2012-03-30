
<%@ page import="marvelmap.PointOfInterest" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pointOfInterest.label', default: 'PointOfInterest')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pointOfInterest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pointOfInterest" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'pointOfInterest.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'pointOfInterest.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateAdded" title="${message(code: 'pointOfInterest.dateAdded.label', default: 'Date Added')}" />
					
						<g:sortableColumn property="lat" title="${message(code: 'pointOfInterest.lat.label', default: 'Lat')}" />
					
						<g:sortableColumn property="lng" title="${message(code: 'pointOfInterest.lng.label', default: 'Lng')}" />
					
						<g:sortableColumn property="rating" title="${message(code: 'pointOfInterest.rating.label', default: 'Rating')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pointOfInterestInstanceList}" status="i" var="pointOfInterestInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pointOfInterestInstance.id}">${fieldValue(bean: pointOfInterestInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: pointOfInterestInstance, field: "description")}</td>
					
						<td><g:formatDate date="${pointOfInterestInstance.dateAdded}" /></td>
					
						<td>${fieldValue(bean: pointOfInterestInstance, field: "lat")}</td>
					
						<td>${fieldValue(bean: pointOfInterestInstance, field: "lng")}</td>
					
						<td>${fieldValue(bean: pointOfInterestInstance, field: "rating")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pointOfInterestInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
