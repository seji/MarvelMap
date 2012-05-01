
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
		<label for="IW_rating">Rating = </label>
		<input type="text" id="IW_rating" name="IW_rating" readOnly=true value="${fieldValue(bean: poiInfoList, field: "rating")}"/>
	</ul>

	
	<input type="hidden" name="IW_marker_id" id="IW_marker_id" value="${fieldValue(bean: poiInfoList, field: "id")}" />
	<!-- <input type="hidden" name="IW_rating" id="IW_rating" value="${fieldValue(bean: poiInfoList, field: "rating")}" />  -->
	<input type="button" id="plus_button" onclick="updateRatingPlus()" value="Rating +"/> 
	<input type="button" id="minus_button" onclick="updateRatingMinus()" value="Rating -"/> 
	

</div>


