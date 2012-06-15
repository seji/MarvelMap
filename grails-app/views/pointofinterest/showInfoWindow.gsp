<style>

body {
	font-size: 90%;
}
/*#info_window { width: 400px; height: 300px; padding: 0.4em;}*/
#info_window { 
	margin: 0;
	padding: 0.7em;
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
	max-width: 150px;
	max-height: 150px;
	/*-moz-box-shadow:    3px 3px 5px 6px #ccc;
  	-webkit-box-shadow: 3px 3px 5px 6px #ccc;*/
 	/*box-shadow:         3px 3px 5px 6px #ccc;*/
 	box-shadow: 3px 3px 5px #999;
}

#rating_counter {
	margin: 0;
	padding: 0.4em;
	text-align: center;
	font-size: 1.5em;  
	min-width: 250px;
	
	/*border-style:dashed;
	border-width:1px;
	border-color:green;*/
}

.bottom_line {
 	border: 0;
    height: 0;
    margin: 0;
	padding: 0;
    border-top: 1px solid rgba(0, 0, 0, 0.1);
    border-bottom: 1px solid rgba(255, 255, 255, 0.3); 
}


#adv {
	margin: 0;
	padding: 0.4em;
	height: 2em;

	/*border-style:dashed;
	border-width:1px;
	border-color:green;*/
}

/*button taken from here http://www.wpclipart.com/signs_symbol/button/*/
.plus_button{
    /*background:url(/MarvelMap/images/up.png) no-repeat;*/
    width: 52px;
	height: 52px;
    cursor:pointer;
}

.minus_button{
    /*background:url(/MarvelMap/images/down.png) no-repeat;*/
    width: 52px;
	height: 52px;
    cursor:pointer;
}

</style>

<input type="hidden" name="IW_marker_id" id="IW_marker_id"	value="${fieldValue(bean: poiInfoList, field: "id")}" /> 
<input type="hidden" name="IW_marker_rating" id="IW_marker_rating" value="${fieldValue(bean: poiInfoList, field: "rating")}" />

<div id="info_window" class="ui-widget"> 
			<h3 title="Name" class="ui-widget-header ui-corner-all">
				${fieldValue(bean: poiInfoList, field: "name")}
			</h3>

			<div id="content_wrapper" class="ui-widget">
				<div id="image_wrapper" title="Image" class="ui-widget">
					<!-- <img src="http://www.digyourowngrave.com/content/eiffel_tower.jpg" class="image"/> -->
					<!-- <img src="http://olivia2010kroth.files.wordpress.com/2010/03/lac_baikal_02.jpg" class="image"/> -->
					<!-- <img src="https://encrypted-tbn2.google.com/images?q=tbn:ANd9GcQvFSDvEOtNugFDS_nPu5ZxlyERyU283aKqqfoJylYVNXg41wui" class="image"/>	 -->	
					<img src="${fieldValue(bean: poiInfoList, field: "imageURL")}" class="image"/>
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
				<input type="button" title="Increase rating" class="plus_button ui-button-text-only" id="plus_button" onclick="updateRating(true)"	value="+" />
				<label id="IW_rating"></label>
				<input type="button" title="Decrease rating" class="minus_button ui-button-text-only" id="minus_button" onclick="updateRating(false)" value="-" />
			</div>
			<div style="clear: both;"></div>
			
			<hr class="bottom_line"/>
			
			<div id="adv" title="Advertising" class="ui-widget">
				<label> Advertising  </label>
			</div>
</div>	

