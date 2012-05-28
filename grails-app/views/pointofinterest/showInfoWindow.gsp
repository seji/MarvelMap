<!DOCTYPE html>
<style>
body {
	font-size: 90%;
}
/*#info_window { width: 400px; height: 300px; padding: 0.4em;}*/
#info_window { 
	/*width: 400px;*/
	/*min-width:560px;*/
	/*height: 300px;*/
	margin: 0;
	padding: 0.4em;

	border-style:dashed;
	border-width:1px;
	border-color:blue;
}

#info_window h4 {
	margin: 0;
	padding: 0.4em;
	text-align: center
}


#content_wrapper{
	position: relative;
	overflow: hidden;
	
	border-style:dashed;
	border-width:1px;
	border-color:red;
}

#rating_counter {
	margin: 0;
	padding: 0.4em;
	/*position:relative;*/
	
	margin-top:20px;
	/*left: 50%;*/
	/*float: left;*/
	/*margin: 0 0 0 -50%;*/
	
	border-style:dashed;
	border-width:1px;
	border-color:green;

}

/*#rating_counter_wrapper {
	position:relative;
	/*height: 160px;*/
	/*margin: 0;
	padding: 0.4em;
	text-align: center;
	*/
/*	border-style:dashed;
	border-width:1px;
	border-color:red;
	

}
*/

#description_wrapper {

	position: absolute;
	/*float: left;
	width: 70%;*/
	
	border-style:dashed;
	border-width:1px;
	border-color:green;
}
#image_wrapper {

	position: absolute;
	float: right;
	top:0;
 right:0;
	/*width: 50%;*/
	
	border-style:dashed;
	border-width:1px;
	border-color:green;
}
.image_label{
	height: 56px;
	width: 56px;

}


#buttons_wrapper {
	position: relative;
	/*float: left;*/
	margin: 0;
	padding: 0.4em;
	/*font-size:3em;*/
	/*text-align: center*/
	
	border-style:dashed;
	border-width:1px;
	border-color:blue;
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

.clear {
	clear: both
}



</style>

<div id="info_window" title="info_window" class="ui-widget">  

			<h4 class="ui-widget-header ui-corner-all">
				${fieldValue(bean: poiInfoList, field: "name")}
			</h4>

			<div id="content_wrapper">
						
				<div id="description_wrapper" title="Description" class="ui-widget">
					<label>
						${fieldValue(bean: poiInfoList, field: "description")}
					</label>
				</div>
				
				
				
				<div id="image_wrapper" title="Image" class="ui-widget">
					<img src="http://www.digyourowngrave.com/content/eiffel_tower.jpg" class="image_label"/>
				</div>
				
				<hr class="clear"/>
			</div>
			
		


</div>	

