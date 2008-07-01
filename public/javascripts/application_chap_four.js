var map;
var centerLatitude = 40.6897;
var centerLongitude = -95.0446;
var startZoom = 3;

var RonJonLogo = new GIcon();
RonJonLogo.image = "http://book.earthcode.com/chapter4/StoreLocationMap/ronjonsurfshoplogo.png"
RonJonLogo.iconSize = new GSize(48, 24);
RonJonLogo.iconAnchor = new GPoint(24, 14);
RonJonLogo.infoWindowAnchor = new GPoint(24, 24);

function addMarker(latitude, longitude, description) {
	var marker = new GMarker(new GLatLng(latitude, longitude), RonJonLogo);
	GEvent.addListener(marker, 'click',
		function() { marker.openInfoWindowHtml(description); }
	);
	
	map.addOverlay(marker);
}

function init() {
  if (!GBrowserIsCompatible())
	return;
	
	map = new GMap2(document.getElementById("map"));
	map.addControl(new GSmallMapControl());
	map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom);

	for (i = 0; i < stores.length; ++i) {
		addMarker(stores[i].lat, stores[i].lng, stores[i].name)
	}
}

window.onload = init;
window.onunload = GUnload;

