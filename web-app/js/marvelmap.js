///////////////////////////////////////////////////////////////////////////////

//Initializes google.map, adds listeners

///////////////////////////////////////////////////////////////////////////////

function initialize() {
	var myOptions = {
		center : new google.maps.LatLng(10, -10),
		zoom : 8,
		mapTypeId : google.maps.MapTypeId.ROADMAP,
		minZoom : 3
	};

	// create map
	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	// initialize infowindow
	infowindow = new google.maps.InfoWindow({
		content : ""
	});
	
	
	google.maps.event.addListener(infowindow, 'domready', function() {
		document.getElementById('IW_rating').innerHTML = $("#IW_marker_rating").val();
	});  

	google.maps.event.addListener(map, 'rightclick', function(event) {
		clickLocation = event.latLng;
		clickZoom = map.getZoom();

		$.get('/MarvelMap/PointOfInterest/menu', function(data) {
			$('.contextMenu').html(data);
		});
	});

	markersArray = [];

	showPOIinBounds();
	$.each('open dragend zoom_changed'.split(' '), 
			function(i, name) {google.maps.event.addListener(map, name,
					function() {
						showPOIinBounds();
					});
	});

	/*
	 * Create the menu and attached it to the map
	 */
	context_menu = new contextMenu({
		map : map
	});

}// end initialize

// /////////////////////////////////////////////////////////////////////////////

// Deletes markers from the map (those which were added to the array)

// /////////////////////////////////////////////////////////////////////////////
function clearOverlays() {
	if (markersArray) {
		for ( var i = 0; i < markersArray.length; i++) {
			markersArray[i].setMap(null);
		}
	}
}

// /////////////////////////////////////////////////////////////////////////////

// Show markers which fit into screen

// /////////////////////////////////////////////////////////////////////////////
function showPOIinBounds() {
	$("#map_canvas").spin("custom", "white");
	setTimeout(function() {
		// clear existing markers from the map
		clearOverlays();
		// clear markers array
		markersArray = [];
		// show all POIs within current bounds
		$.post('/MarvelMap/PointOfInterest/showPOIinBounds', {
			NElat : map.getBounds().getNorthEast().lat(),
			NElng : map.getBounds().getNorthEast().lng(),
			SWlat : map.getBounds().getSouthWest().lat(),
			SWlng : map.getBounds().getSouthWest().lng()
		}, function(data) {
			$('.contextMenu').html(data);
		});
		$("#map_canvas").spin(false);
	}, 500);
}

// /////////////////////////////////////////////////////////////////////////////

// Places actual markers on the map

// /////////////////////////////////////////////////////////////////////////////
function placeMarker(id, pos, name, desc, rating, newPOI) {
	 var marker = new google.maps.Marker({
		id : id,
		position : pos,
		title : name,
		draggable : false,
		map : map
	});
	if (newPOI) {
		var image = new google.maps.MarkerImage(
				'http://maps.google.com/mapfiles/ms/micons/green-dot.png',
				new google.maps.Size(32, 32), // size
				new google.maps.Point(0, 0), // origin
				new google.maps.Point(16, 32) // anchor
		);
		var shadow = new google.maps.MarkerImage(
				'http://maps.google.com/mapfiles/ms/micons/msmarker.shadow.png',
				new google.maps.Size(59, 32), // size
				new google.maps.Point(0, 0), // origin
				new google.maps.Point(16, 32) // anchor
		);
		marker.setIcon(image);
		marker.setShadow(shadow);
		marker.setZIndex(999);
	} else {
		markersArray.push(marker);
	}
	google.maps.event.addListener(marker, 'mouseover', function(event) {
	});

	google.maps.event.addListener(marker, 'mouseout', function(event) {
	});

	google.maps.event.addListener(marker, 'click', function() {
		infowindow.close();
		$.post('/MarvelMap/PointOfInterest/showInfoWindow', {
			id : marker.id
		}, function(data) {
			infowindow.setContent(data)
		});
		infowindow.open(map, marker);
	});

}



// /////////////////////////////////////////////////////////////////////////////

// Updates rating

// /////////////////////////////////////////////////////////////////////////////
function updateRating(increase) {
	if (increase) {
		var _inc = true;
	} else {
		var _inc = false;
	}
	$("#map_canvas").spin("custom", "white");
	$.post('/MarvelMap/PointOfInterest/updateRating', {
		inc : _inc,
		id : $("#IW_marker_id").val()
	}, function(data) {
		updateRatingInfoWindow(data);
	});
	$("#map_canvas").spin(false);
}

///////////////////////////////////////////////////////////////////////////////

//Update rating on the InfoWindow

///////////////////////////////////////////////////////////////////////////////
function updateRatingInfoWindow(data) {
	document.getElementById('IW_rating').innerHTML = data;
	//$('#IW_rating').val(data);
	//$("input:submit, input:button").effect('fade',100);

}

// /////////////////////////////////////////////////////////////////////////////

// shows dialog for adding a new POI, then saves data

// /////////////////////////////////////////////////////////////////////////////
function newPOIDialog() {

	$(function() {
		$("#dialog-form")
				.dialog(
						{
							autoOpen : true,
							height : 400,
							width : 500,
							modal : true,
							resizable : false,
							draggable : false,
							buttons : {
								"Create" : function() {
									// var my_form = $('form').serialize();
									// document.write(my_form);
									document.getElementById('lat').value = clickLocation
											.lat();
									document.getElementById('lng').value = clickLocation
											.lng();
									// document.getElementById('zoom').value =
									// clickZoom.toString();
									$("#map_canvas").spin("custom", "white");
									$.post('/MarvelMap/PointOfInterest/save',
											$('form').serialize(), function(
													data) {
												$('.contextMenu').html(data);
												$('form').empty();// Clear
												// form data
												$("#map_canvas").spin(false);
											});
									$(this).dialog("close");
								},
								"Cancel" : function() {
									$(this).dialog("close");
									$('form').empty();// Clear form data
								}
							}
						});
	});
}

// /////////////////////////////////////////////////////////////////////////////

// Confirm POI was saved successfully

// /////////////////////////////////////////////////////////////////////////////
function newPOISaveConfirm() {
	$(function() {
		$("#dialog-message").dialog({
			modal : true,
			title : "Marvel Map",
			draggable : false,
			resizable : false,
			buttons : {
				"OK" : function() {
					placeMarker(id, p, n, d, r, true);

					$(this).dialog("close");
				}
			}
		});
	});

}

/*
function showInfoWindow() {
$(function() {
	$( "#info_window" ).dialog({
		modal: true,
		title : "Marvel Map",
		draggable : false,
		resizable : false,
		buttons: {
			"Start!": function() {
				$( this ).dialog( "close" );
			}
		}
	});
});
}
*/