var map;
var centerLatitude = 37.4419;
var centerLongitude = -122.1419;
var startZoom = 12;

function createMarker() {
	var lng = $('longitude').value;
	var lat = $('latitude').value;
	var formValues = Form.serialize('geocache-input');
	new Ajax.Request('create',
		{
			parameters: formValues,
			onComplete: function(request) {
				res = eval("(" + request.responseText + ")");
				
				if (!res.success) {
					alert(res.content);
				}
				else {
					var latlng = new GLatLng(parseFloat(lat), parseFloat(lng));
					var marker = addMarkerToMap(latlng, res.content, res.icon);
					map.addOverlay(marker);
					map.closeInfoWindow();
				}
			}
		});

	return false;
}

function listMarkers() {
	var request = GXmlHttp.create();
	request.open('GET', 'list', true);
	request.onreadystatechange = function() {
		if (request.readyState == 4) {
			markers = eval("(" + request.responseText + ")");
			for (var i = 0; i < markers.length; ++i) {
				var marker = markers[i].marker;
				var lat = marker.lat;
				var lng = marker.lng;
				
				if (lat && lng) {
					var latlng = new GLatLng(parseFloat(lat), parseFloat(lng));
					
					var html = '<div><strong>Found</strong> '
					+ marker.found
					+ '</div><div><strong>Left</strong> '
					+ marker.left
					+ '</div>';

					map.addOverlay(addMarkerToMap(latlng, html, marker.icon));
				}
			}
		}
	}
	
	request.send(null);
}

function addMarkerToMap(latlng, html, iconImage) {
	if (iconImage != "") {
		var icon = new GIcon();
		icon.image = iconImage;
		icon.iconSize = new GSize(25, 25);
		icon.iconAnchor = new GPoint(14, 25);
		icon.infoWindowAnchor = new GPoint(14, 14);
		var marker = new GMarker(latlng, icon);
	}
	else {
		var marker = new GMarker(latlng);
	}
	
	GEvent.addListener(marker, 'click', function() {
		var markerHTML = html;
		marker.openInfoWindowHtml(markerHTML);
	});
	return marker;
}

function onMapClick(overlay, latlng) {
	/* click on a marker also tiggers this event, but without a latlng value*/
	if (!latlng)
		return;
		
	var inputForm = document.createElement("form");
	inputForm.setAttribute("action", "");
	inputForm.onsubmit = function() { createMarker(); return false; }
	inputForm.id = 'geocache-input';

	var lng = latlng.lng();
	var lat = latlng.lat();

	inputForm.innerHTML = '<fieldset style="width:150px;">'
	+ '<legend>New Marker</legend>'
	+ '<label for="found">Found</label>'
	+ '<input type="text" id="found" name="m[found]" style="width: 100%;" />'
	+ '<label for="left">Left</label>'
	+ '<input type="text" id="left" name="m[left]" style="width: 100%;" />'
	+ '<label for="icon">Icon URL</label>'
	+ '<input type="text" id="icon" name="m[icon]" style="width: 100%" />'
	+ '<input type="submit" value="Save" />'
	+ '<input type="hidden" id="longitude" name="m[lng]" value="' + lng + '" />'
	+ '<input type="hidden" id="latitude" name="m[lat]" value ="' + lat + '" />'
	+ '</fieldset>';
	map.openInfoWindow(latlng, inputForm);
}

function init() {
  if (!GBrowserIsCompatible())
	return;
	
	map = new GMap2(document.getElementById("map"));
	listMarkers();
	map.addControl(new GSmallMapControl());
	map.addControl(new GMapTypeControl());
	map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom);

	GEvent.addListener(map, 'click', onMapClick);
}

window.onload = init;
window.onunload = GUnload;

