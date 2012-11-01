<!DOCTYPE html>
<style>
body { font-size: 90%; }
label,input {
	display: block;
}

input.text {
	/*margin-bottom: 12px;*/
	width: 97%;
	padding: 0.4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 0.4em;
}

#desc_text_field{
	resize: none;
	width: 97%;
	padding: 0.4em;
}


#image_search_results{
	/*border-style:dashed;
	border-width:1px;
	border-color:blue;*/
    text-align: center;
}

.cse_image{
	/*border-style:dashed;
	border-width:1px;
	border-color:red;*/
	opacity: 0.7;
	max-width: 84px;
	max-height: 84px;
	margin: 0.4em;
	vertical-align: middle;
	border: 5px solid #eee;
	box-shadow: 3px 3px 5px #999;
	
	/*Transition*/
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
 
	/*Reflection
	-webkit-box-reflect: below 0px -webkit-gradient(linear, left top, left bottom, from(transparent), color-stop(.7, transparent), to(rgba(0,0,0,0.1)));
	*/
	
}

.cse_image_hover{
	opacity: 1;
	/*Glow*/
	-webkit-box-shadow: 0px 0px 50px rgba(246,173,53,0.9);
	-moz-box-shadow: 0px 0px 50px rgba(246,173,53,0.9);
	box-shadow: 0px 0px 50px rgba(246,173,53,0.9);
}

.cse_image_clicked{
	opacity: 1;
	max-width: 150px;
	max-height: 150px;
	box-shadow: 3px 3px 5px #999;
}

</style>
<script src="http://www.google.com/jsapi" type="text/javascript"></script>

<script type="text/javascript">
	newPOIDialog();
</script>

<script type="text/javascript">
function imageSearch(search_string, target_div) {

	if (search_string ==""){return} 

	$(target_div).empty();

	$.getJSON("https://www.googleapis.com/customsearch/v1?", {
		key : "AIzaSyCEevZNwXfSdSvUSsC72_nmEkD4QXRBopg", //this is my personal key
		cx : "007249607099659389996:l0fsrgujgta", //this is my personal CSE id
		q :	search_string,
		searchType : "image",
		//fileType : "jpg",
		//imgSize : "large",
		safe : "high",
		alt : "json"
		}, 
		function(data) {
			    $.each(data.items, function(i,item){
			      $("<img/>")
			      .attr({
					      src: item.image.thumbnailLink,
					      id: "cse_img",
					      class: "cse_image ui-corner-all"
			    		})
			    .click(function(){
			    	document.getElementById('imageURL').value = item.image.thumbnailLink;
			    	$(target_div).empty();

			    	$("<img/>").attr({
						      src: item.image.thumbnailLink,
						      id: "cse_img",
						      class: "cse_image_clicked ui-corner-all"
				    		}).appendTo(target_div);

			    	
			    	
				    
				    })
				.hover(function(){
						$(this).addClass("cse_image_hover")
			    	},function() {	
			    		$(this).removeClass("cse_image_hover")
			    	}
		    	)
			    .appendTo(target_div);
			      //if ( i == 4 ) return false;
			    });
			  });

}



</script>

<script type="text/javascript">
$("#name_text_field").focusout(function() {
	var _name = $("#name_text_field").val();
	
	//$("#image_search_results").text(imageSearch(_name));
	imageSearch(_name,"#image_search_results");
	
	
	});


</script>

<div id="new_POI_dialog" title="Create new Point of Interest">
	<g:form action="save">
		<fieldset>
			<label for="poiName">Enter Point of Interest name</label>
			<g:textField id="name_text_field" name="name" maxlength="100" class="text ui-widget-content ui-corner-all" onkeypress="if(event.keyCode==13){return false;}"/>
			<label for="poiDesc">Enter your description</label>
			<g:textArea id="desc_text_field" name="description"	maxlength="500" rows="5" class="text ui-widget-content ui-corner-all" onkeypress="if(event.keyCode==13){return false;}"/>

			<g:hiddenField type="hidden" name="lat" id="lat" value=""/>
			<g:hiddenField type="hidden" name="lng" id="lng" value=""/>
			<g:hiddenField type="hidden" name="zoom" id="zoom" value=""/>
			<g:hiddenField type="hidden" name="imageURL" id="imageURL" value=""/>
			<div id="image_search_results"></div>
			

	

		</fieldset>
	</g:form>
</div>




