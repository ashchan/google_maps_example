var centerLatitude = 30.215168;
var centerLongitude = 120.277977;
var startZoom = 10;


function init() {
  if (GBrowserIsCompatible()) {
    var map = new GMap2(document.getElementById("map"));
    map.setCenter(new GLatLng(centerLatitude, centerLongitude), startZoom);
  }
}

window.onload = init;
window.onunload = GUnload;

