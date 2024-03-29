<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"
	charset='utf-8' />
<title>Marvel Map 0.1</title>
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

#map_canvas {
	height: 100%
}

.contextMenu {
	position: absolute;
	z-index: 1000;
	display: none;
	min-width: 120px;
	background: #eee;
	border: 1px solid #777;
}

.contextMenu ul {
	padding: 3px 0px;
	margin: 0px;
	border: solid 1px #fff;
}

.contextMenu li {
	list-style: none;
	padding: 0px 1px;
	margin: 0px;
}

.contextMenu a {
	display: block;
	color: #000;
	text-decoration: none;
	line-height: 22px;
	height: 22px;
	padding: 1px 8px;
}

.contextMenu li.hover a {
	padding: 0px 7px;
	background-color: #DFE6F5;
	border: 1px solid #A2C1FA;
	border-radius: 2px;
}

.contextMenu li.separator div {
	margin: 3px 0px;
	border-top: solid 1px #ccc;
	border-bottom: solid 1px #fff;
}
</style>

<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCEevZNwXfSdSvUSsC72_nmEkD4QXRBopg&sensor=false"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="code.js"></script>

<script type="text/javascript">
	var location;

	function initialize() {
		var myOptions = {
			center : new google.maps.LatLng(10, -10),
			zoom : 4,
			mapTypeId : google.maps.MapTypeId.ROADMAP,

		};
		var map = new google.maps.Map(document.getElementById("map_canvas"),
				myOptions);

		google.maps.event.addListener(map, 'rightclick', function(event) {
			//mapZoom = map.getZoom();
			startLocation = event.latLng;
			//iw.open(map, marker2);
			//placeMarker(startLocation);
			//$(function() {alert('Message');});
			var contextMenu = $('#contextMenu');

		});

		function placeMarker(pos) {
			var marker = new google.maps.Marker({
				//position : new google.maps.LatLng(10, -10.1),
				position : pos,
				title : "Езжай сюды!",
				draggable : true,
				map : map
			});

			//iw.open(map, marker);
		}

		var iw = new google.maps.InfoWindow({
			content : "Езжай сюды!"
		});
		//placeMarker();

		/**
		 * Create the menu and attached it to the map
		 */
		var menu = new contextMenu({
			map : map
		});

		// Add some items to the menu
		menu.addItem('Zoom In', function(map, latLng) {
			map.setZoom(map.getZoom() + 1);
			map.panTo(latLng);
		});

		menu.addItem('Zoom Out', function(map, latLng) {
			map.setZoom(map.getZoom() - 1);
			map.panTo(latLng);
		});

		menu.addSep();

		menu.addItem('Center Here', function(map, latLng) {
			map.panTo(latLng);
		});

	} // end initialize
</script>

<script type="text/javascript">
	/**
	 * Context Menu for google maps
	 */
	(function(window, undefined) {

		// Use the correct document accordingly with window argument (sandbox)
		var document = window.document,

		// shorthand some stuff
		$ = jQuery, g = google.maps;

		/**
		 * Create the context menu
		 *
		 * @param array opts Array of options.
		 * @todo Menu id needs to be unique, in case of multiple maps and context menus
		 */
		function contextMenu(opts) {
			// A way to access 'this' object from inside functions
			var self = this;

			if (opts.map !== undefined) {
				// Put the map onto the object
				this.theMap = opts.map;

				// Keep track of where you clicked, for the callback functions.
				this.clickedLatLng = null;

				// Create the context menu element
				this.theMenu = $(document.createElement('div')).attr('class',
						'contextMenu')

				// .. disable the browser context menu on our context menu
				.bind('contextmenu', function() {
					return false;
				})

				// .. append a ul list element
				.append($(document.createElement('ul')))

				// .. then append it to the map object
				.appendTo(this.theMap.getDiv());

				// Display and position the menu
				g.event
						.addListener(
								this.theMap,
								'rightclick',
								function(e) {
									// Shorthand some stuff
									var mapDiv = $(self.theMap.getDiv()), menu = self.theMenu, x = e.pixel.x, y = e.pixel.y;

									// Hide the context menu if its open
									menu.hide();

									// Save the clicked location
									self.clickedLatLng = e.latLng;

									// Adjust the menu if clicked to close to the edge of the map
									if (x > mapDiv.width() - menu.width())
										x -= menu.width();

									if (y > mapDiv.height() - menu.height())
										y -= menu.height();

									// Set the location and fade in the context menu
									menu.css({
										top : y,
										left : x
									}).fadeIn(200);
								});

				// Hide context menu on several events
				$.each(
						'click dragstart zoom_changed maptypeid_changed center_changed'
								.split(' '), function(i, name) {
							g.event.addListener(self.theMap, name, function() {
								self.theMenu.hide();
							});
						});
			}
		}

		/**
		 * Add new items to the context menu
		 *
		 * @param string   name     Name of the list item.
		 * @param function callback Function to run when you click the list item
		 * @return jQuery           The list item that is created.
		 */
		contextMenu.prototype.addItem = function(name, loc, callback) {
			// If no loc was provided
			if (typeof loc === 'function') {
				callback = loc;
				loc = undefined;
			}

			// A way to access 'this' object from inside functions
			var self = this,

			// The name turned into camelCase for use in the li id, and anchor href
			idName = name.toCamel(),

			// The li element
			li = $(document.createElement('li')).attr('id', idName);

			// the anchor element
			$(document.createElement('a')).attr('href', '#' + idName)
					.html(name).appendTo(li)

					// Add some nice hover effects
					.hover(function() {
						$(this).parent().toggleClass('hover');
					})

					// Set the click event
					.click(function() {

						// fade out the menu
						self.theMenu.hide();

						// call the callback function - 'this' would refer back to the jQuery object of the item element
						callback.call(this, self.theMap, self.clickedLatLng);

						// make sure the click doesnt take us anywhere
						return false;
					});

			// If `loc` is a number put it at that location
			if (typeof loc === 'number' && loc < this.theMenu.find('li').length)
				this.theMenu.find('li').eq(loc).before(li);

			// .. else appened it to the end of the menu
			else
				this.theMenu.find('ul').append(li);

			// Return the whole list item
			return li;
		};

		/**
		 * Add a seperators
		 *
		 * @return jQuery The list item that is created.
		 */
		contextMenu.prototype.addSep = function(loc) {
			// Create the li element
			var li = $(document.createElement('li')).addClass('separator')

			// .. add a div child
			.append($(document.createElement('div')))

			// If loc is a number put the li at that location
			if (typeof loc === 'number')
				this.theMenu.find('li').eq(loc).before(li)

				// .. else appened it to the end
			else
				this.theMenu.find('ul').append(li);

			// Return the li element
			return li
		};

		/**
		 * Remove a menu list item.
		 *
		 * @param string name The string used to create the list item.
		 * @param number name The index value of the list item.
		 * @param jQuery name The jQuery object that is returned by addItem() or addSep()
		 */
		contextMenu.prototype.remove = function(item) {
			// No need to search for name if its a jquery object
			if (item instanceof $)
				item.remove();

			// Find all the elements and remove the one at the specified index
			else if (typeof item === 'number')
				this.theMenu.find('li').eq(item).remove()

				// Find all the items by the id name and remove them
			else if (typeof item === 'string') {
				// Find and remove the element
				this.theMenu.find('#' + item.toCamel()).remove()
			}
		};

		// Expose this to the global object
		window.contextMenu = contextMenu;

		/**
		 * Convert a string into a 'camelCase' string
		 *
		 * @example 'Camel case string'.toCamel() -> 'camelCaseString'
		 */
		String.prototype.toCamel = function() {
			return this.toLowerCase().replace(/(\s)([a-z])/gi,
					function(match, group1, group2) {
						return group2.toUpperCase().replace(group1, '');
					});
		}
	})(window);
</script>

</head>
<body onload="initialize()">

	<div id="map_canvas" style="width: 100%; height: 100%"></div>




</body>
</html>