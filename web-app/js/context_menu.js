/**
 * Context Menu for google maps
 */
(function(window, undefined){

	// Use the correct document accordingly with window argument (sandbox)
	var document = window.document,

		// shorthand some stuff
		$ = jQuery,
		g = google.maps;

	/**
	 * Create the context menu
	 *
	 * @param array opts Array of options.
	 * @todo Menu id needs to be unique, in case of multiple maps and context menus
	 */
	function contextMenu(opts)
	{
		// A way to access 'this' object from inside functions
		var self = this;

		if ( opts.map !== undefined )
		{
			// Put the map onto the object
			this.theMap = opts.map;

			// Keep track of where you clicked, for the callback functions.
			this.clickedLatLng = null;

			// Create the context menu element
			this.theMenu = $(document.createElement('div'))
				.attr('class', 'contextMenu')

				// .. disable the browser context menu on our context menu
				.bind('contextmenu', function() { return false; })

				// .. append a ul list element
				.append($(document.createElement('ul')))

				// .. then append it to the map object
				.appendTo(this.theMap.getDiv());

///////////////////////////LISTENER/////////////////////////////////
			// Display and position the menu
			g.event.addListener(this.theMap, 'rightclick', function(e)
			{
				// Shorthand some stuff
				var mapDiv = $(self.theMap.getDiv()),
					menu = self.theMenu,
					x = e.pixel.x,
					y = e.pixel.y;

				// Hide the context menu if its open
				menu.hide();

				// Save the clicked location
				self.clickedLatLng = e.latLng;

				// Adjust the menu if clicked to close to the edge of the map
				if ( x > mapDiv.width() - menu.width() )
					x -= menu.width();

				if ( y > mapDiv.height() - menu.height() )
					y -= menu.height();

				// Set the location and fade in the context menu
				menu.css({ top: y, left: x }).fadeIn(200);
			});
/////////////////////////END LISTENER/////////////////////////////////			

			
			// Hide context menu on several events
			$.each('click dragstart zoom_changed maptypeid_changed center_changed'.split(' '), function(i,name){
				g.event.addListener(self.theMap, name, function(){ self.theMenu.hide(); });
			});
		}
	}

	// Expose this to the global object
	window.contextMenu = contextMenu;
	
	

	/**
	 * Convert a string into a 'camelCase' string
	 *
	 * @example 'Camel case string'.toCamel() -> 'camelCaseString'
	 */
	String.prototype.toCamel = function() {
		return this.toLowerCase().replace(/(\s)([a-z])/gi, function(match, group1, group2){
			return group2.toUpperCase().replace(group1,'');
		});
	}
})(window);

$(document).ready( function(){
	$("#addPOI").click(function(){
		  alert('click');
	});
	});