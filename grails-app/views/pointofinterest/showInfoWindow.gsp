<!DOCTYPE html>
<style>
body {
	font-size: 70%;
}
/*#info_window { width: 400px; height: 300px; padding: 0.4em;}*/
#info_window { 
	width: 400px;
	height: 300px;
	padding: 0.4em;
	
}

#inner_info_window { 
	width: 390px;
	padding: 0.4em;
	float: left;
}

#inner_info_window h3 {
	margin: 0;
	padding: 0.4em;
	text-align: center
}

#inner_info_window h2 {
	margin: 0;
	padding: 0.4em;
	text-align: left;
}

/*#inner_info_window_left {
	width: 130px;
	height: 300px;
	padding: 0.4em;
	float: left;
}

#inner_info_window_right {
	width: 130px;
	height: 300px;
	padding: 0.4em;
	float: left;
}
*/
#rating_counter {
	position: relative;
	/*clear:both;*/

}

#rating_counter_wrapper {

	height: 130px;
	margin: 0;
	padding: 0.4em;
	text-align: center;
	

}

#description_wrapper {
	margin: 0;
	padding: 0.4em;
}

#buttons_wrapper {
	position: relative;
	float: left;
	margin: 0;
	padding: 0.4em;
	font-size:3em;
	/*text-align: center*/
}

/*button taken from here http://www.wpclipart.com/signs_symbol/button/*/
.plus_button{
    background:url(/MarvelMap/images/up.png) no-repeat;
    width: 52px;
	height: 52px;
    cursor:pointer;
    border: none;

 
}

.plus_button:hover{
    background:url(/MarvelMap/images/down.png) no-repeat;
    width: 52px;
	height: 52px;

}

.minus_button{
/*    background:url(/MarvelMap/images/down.png) no-repeat;
    width: 52px;
	height: 52px;
    cursor:pointer;
    border: none;
*/

}

.clear {
	clear: both
}
</style>

<div id="info_window" class="ui-widget">

<!--	<div id="inner_info_window_left" title="Info window" class="ui-widget-content ui-corner-all">
 		<img src="images/eiffel_tower.jpg"/>  
	</div>
-->
	<div id="inner_info_window" class="ui-widget">

		<h3 class="ui-widget-header ui-corner-all">
			${fieldValue(bean: poiInfoList, field: "name")}
		</h3>

		<div id="description_wrapper" title="Description"	class="ui-widget">
			<label for="desc">
				${fieldValue(bean: poiInfoList, field: "description")}
			</label>
		</div>


		<input type="hidden" name="IW_marker_id" id="IW_marker_id"	value="${fieldValue(bean: poiInfoList, field: "id")}" /> 
		<input type="hidden" name="IW_marker_rating" id="IW_marker_rating" value="${poiInfoList.rating}" />

<!--		<div id="buttons_wrapper" title="Update rating" class="ui-widget-content ui-corner-all">
			<input type="button" id="plus_button" onclick="updateRating(true)"	value="Rating +" /> 
			<input type="button" id="minus_button" onclick="updateRating(false)" value="Rating -" />
		</div>
-->	

 		<div id="rating_counter_wrapper" title="Current rating" class="ui-widget">  
			<h2>Rating:</h2>
						<div id="rating_counter" class="flip-counter"> </div>
			<div id="buttons_wrapper">
				<input type="button" title="Increase rating" class="plus_button" id="plus_button" onclick="updateRating(true)"	value="+" /> 
				<p></p>
				<input type="button" title="Decrease rating" class="minus_button" id="minus_button" onclick="updateRating(false)" value="-" />
			</div>		


			

		</div>

	</div>
	
<!-- 	
	<div id="inner_info_window_right" class="ui-widget-content ui-corner-all">
		bla bla
	</div>
-->	

</div>

