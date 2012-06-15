

<div id="cse" style="width: 100%;">Loading</div>
	

<script src="http://www.google.com/jsapi" type="text/javascript"></script>

<script type="text/javascript">

	google.load('search', '1', {language : 'en', style : google.loader.themes.MINIMALIST});
	google.setOnLoadCallback(function() {
	  var customSearchOptions = {};
	  var imageSearchOptions = {};
			  imageSearchOptions['layout'] = google.search.ImageSearch.LAYOUT_CLASSIC;
			  customSearchOptions['enableImageSearch'] = true;
			  customSearchOptions['imageSearchOptions'] = imageSearchOptions;
			    
	  var customSearchControl = new google.search.CustomSearchControl(
	    '007249607099659389996:l0fsrgujgta', customSearchOptions);

	  var options = new google.search.DrawOptions();
	    options.enableSearchResultsOnly();
	  customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
	  customSearchControl.draw('cse');
	}, true);




</script>


		