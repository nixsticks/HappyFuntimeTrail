$(document).ready(function(){
  initialize();
});

function initialize() {
  var pin = $('.pin-data').data('pin');
  var currentLocation = new google.maps.LatLng(pin.latitude, pin.longitude);
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.HYBRID,
    center: currentLocation,
    zoom: 20
  });

  panorama = map.getStreetView();
  panorama.setPosition(currentLocation);
  panorama.setVisible(true);
}