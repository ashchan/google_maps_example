var map;
var centerLatitude = 19.5;
var centerLongitude = -155.5; 
var startZoom = 9;


function addMarker(latitude, longitude, description) {
	var marker = new GMarker(new GLatLng(latitude, longitude));
	GEvent.addListener(marker, 'click', 
		function() {
			marker.openInfoWindowHtml(description);
	});
	
	map.addOverlay(marker);
}


function init() {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map"));
	map.addControl(new GSmallMapControl());
    map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom);

	for (i = 0; i < markers.length; ++i) {
		addMarker(markers[i].latitude, markers[i].longitude, markers[i].name);
	}
  }
}

window.onload = init;
window.onunload = GUnload;

