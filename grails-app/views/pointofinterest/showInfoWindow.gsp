<style>

#inner_info_window { width: 540px; padding: 0.4em; }

#inner_info_window h3 {
	margin: 0;
	padding: 0.4em;
	text-align: center;
}
</style>

<div id="info_window" title="Info window" class="ui-widget">

	<div id="inner_info_window" title="Info window"	class="ui-widget-content ui-corner-all">

		<h3 class="ui-widget-header ui-corner-all">
			${fieldValue(bean: poiInfoList, field: "name")}
		</h3>

		<ul>
			<label for="name">Name = ${fieldValue(bean: poiInfoList, field: "name")}</label>
		</ul>

		<ul>
			<label for="id">Id = ${fieldValue(bean: poiInfoList, field: "id")}
			</label>
		</ul>

		<ul>
			<label for="desc">Description = ${fieldValue(bean: poiInfoList, field: "description")}</label>
		</ul>
		<ul>
			
			<!-- <label id="IW_rating">${fieldValue(bean: poiInfoList, field: "rating")}</label>  -->
			<label for="IW_rating">Rating = </label>
			<div id="rating_counter" class="flip-counter">
			
			</div>
			
			<!-- <input type="text" id="IW_rating" name="IW_rating" readOnly=true value="${fieldValue(bean: poiInfoList, field: "rating")}" />  -->
		</ul>

		
		<input type="hidden" name="IW_marker_id" id="IW_marker_id" value="${fieldValue(bean: poiInfoList, field: "id")}" /> 
		<input type="hidden" name="IW_marker_rating" id="IW_marker_rating" value="${fieldValue(bean: poiInfoList, field: "rating")}" /> 		
		
		<input type="button" id="plus_button" onclick="updateRating(true)"	value="Rating +" /> 
		<input type="button" id="minus_button" onclick="updateRating(false)" value="Rating -" />
	</div>

</div>

