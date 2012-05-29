<!DOCTYPE html>
<style>
body {
	font-size: 90%;
}
/*#info_window { width: 400px; height: 300px; padding: 0.4em;}*/
#info_window { 
	margin: 0;
	padding: 0.4em;
	/*border-style:dashed;
	border-width:1px;
	border-color:blue;*/
}

#info_window h3 {
	margin: 0;
	padding: 0.4em;
	text-align: center;
}


#content_wrapper{
	/*border-style:dashed;
	border-width:1px;
	border-color:red;*/
}

#description_wrapper {
	margin: 0;
	padding: 1em 0 1em 0;
	/*border-style:dashed;
	border-width:1px;
	border-color:green;*/
}
#image_wrapper {
	margin: 0;
	padding: 1em 0 1em 1em;
	float: right;
	/*border-style:dashed;
	border-width:1px;
	border-color:green;*/
}
.image {
	width: 100px;
}

#rating_counter {
	margin: 0;
	padding: 0.4em;
	text-align: center;
	font-size: 1.5em;  
	/*border-style:dashed;
	border-width:1px;
	border-color:green;*/
}

.bottom_line {
 	border: 0;
    height: 0;
    border-top: 1px solid rgba(0, 0, 0, 0.1);
    border-bottom: 1px solid rgba(255, 255, 255, 0.3); 
}

/*
#buttons_wrapper {
	margin: 0;
	padding: 0.4em;
	border-style:dashed;
	border-width:1px;
	border-color:blue;
}

button taken from here http://www.wpclipart.com/signs_symbol/button/
.plus_button{
    background:url(/MarvelMap/images/up.png) no-repeat;
    width: 52px;
	height: 52px;
    cursor:pointer;
    border: none;
}

.plus_button:hover{
    background:url(/MarvelMap/images/up_hover.png) no-repeat;
    width: 52px;
	height: 52px;
}

.minus_button{
    background:url(/MarvelMap/images/down.png) no-repeat;
    width: 52px;
	height: 52px;
    cursor:pointer;
    border: none;
}
.minus_button:hover{
    background:url(/MarvelMap/images/down_hover.png) no-repeat;
    width: 52px;
	height: 52px;

}
*/

</style>

<div id="info_window" title="info_window" class="ui-widget">  

			<h3 class="ui-widget-header ui-corner-all">
				${fieldValue(bean: poiInfoList, field: "name")}
			</h3>

			<div id="content_wrapper" class="ui-widget">
				<div id="image_wrapper" title="Image" class="ui-widget">
					<img src="http://www.digyourowngrave.com/content/eiffel_tower.jpg" class="image"/>
				</div>	
		
				<div id="description_wrapper" title="Description" class="ui-widget">
					<label>
						 ${fieldValue(bean: poiInfoList, field: "description")}
					</label>
				</div>
				<div style="clear: both;"></div>
			</div>
							
				<hr class="bottom_line"/>

				<div id="rating_counter" title="Rating" class="ui-widget">
					<label id="IW_rating"></label>
				</div>
				
				<div id="adv" title="Advertising" class="ui-widget">
					<label> bla bla bla </label>
				</div>
				
		
		


</div>	

<input type="hidden" name="IW_marker_id" id="IW_marker_id"	value="${fieldValue(bean: poiInfoList, field: "id")}" /> 
<input type="hidden" name="IW_marker_rating" id="IW_marker_rating" value="${fieldValue(bean: poiInfoList, field: "rating")}" />

