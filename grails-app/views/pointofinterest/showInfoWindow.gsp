

<div id="info_window" title="Info window">

	<ul>
		<label for="id">Id = ${fieldValue(bean: poiInfoList, field: "id")}</label>
	</ul>
	<ul>
		<label for="name">Name = ${fieldValue(bean: poiInfoList, field: "name")}</label>
	</ul>
	<ul>
		<label for="desc">Description = ${fieldValue(bean: poiInfoList, field: "description")}</label>
	</ul>
	<ul>
		<label for="rating">Rating = ${fieldValue(bean: poiInfoList, field: "rating")}</label>
	</ul>
	<div id="test1">
	<script type="text/javascript">
		alert("qwerty");
	</script>
	
	</div>
	<g:form action="updateRatingPlus">
			<g:hiddenField type="hidden" name="id" id="id" value="${fieldValue(bean: poiInfoList, field: "id")}" />
			<g:hiddenField type="hidden" name="rating" id="rating" value="${fieldValue(bean: poiInfoList, field: "rating")}" />
			<g:actionSubmit class="save" action="updateRatingPlus" value="Rating +" />

	</g:form>
		<g:form action="updateRatingMinus">
			<g:hiddenField type="hidden" name="id" id="id" value="${fieldValue(bean: poiInfoList, field: "id")}" />
			<g:hiddenField type="hidden" name="rating" id="rating" value="${fieldValue(bean: poiInfoList, field: "rating")}" />
			<g:actionSubmit class="save" action="updateRatingMinus" value="Rating -" />

	</g:form>
</div>



