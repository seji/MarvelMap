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

.cse_image{
	/*border-style:dashed;
	border-width:1px;
	border-color:red;*/
	max-width: 84px;
	max-height: 84px;
	margin: 0.2em;
	vertical-align: middle;
	box-shadow: 3px 3px 5px #999;
}

.cse_image_hover{
	box-shadow: 6px 6px 10px orange;

}
#image_search_results{
	/*border-style:dashed;
	border-width:1px;
	border-color:blue;*/
    text-align: center;
	
}

</style>
<script src="http://www.google.com/jsapi" type="text/javascript"></script>

<script type="text/javascript">
	newPOIDialog();
</script>

<script type="text/javascript">
function imageSearch(search_string) {

	var cse_url_key = "AIzaSyCEevZNwXfSdSvUSsC72_nmEkD4QXRBopg"; //this is my personal key
	var cse_url_id = "007249607099659389996:l0fsrgujgta"; //this is my personal CSE id
	var cse_url_query =	search_string;	
	var cse_url_imgSize= "large";
	var cse_url = "https://www.googleapis.com/customsearch/v1?key="+cse_url_key+"&cx="+cse_url_id+"&q="+cse_url_query+"&searchType=image&fileType=jpg&imgSize="+cse_url_imgSize+"&alt=json";

	$.getJSON(cse_url, function(data) {
			
			    $.each(data.items, function(i,item){
			      $("<img/>")
			      .attr({
					      src: item.image.thumbnailLink,
					      id: "cse_img",
					      class: "cse_image ui-corner-all"
			    		})
			    .click(function(){
				    alert('click');
				    
				    })
				.hover(function(){
						$(this).addClass("cse_image_hover")
			    	},function() {	
			    		$(this).removeClass("cse_image_hover")
			    	}


		    	)
			    .appendTo("#image_search_results");


			      //if ( i == 4 ) return false;
			    });
			  });

}



</script>

<script type="text/javascript">
$("#name_text_field").focusout(function() {
	var _name = $("#name_text_field").val();
	
	//$("#image_search_results").text(imageSearch(_name));
	imageSearch(_name);
	
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
			
			<div id="image_search_results"></div>
			

	

		</fieldset>
	</g:form>
</div>




