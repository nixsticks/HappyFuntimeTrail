var pin = $('.pin-data').data('pin');
var map;

$(document).ready(function(){
  initialize();
});

function initialize() {
  var currentLocation = new google.maps.LatLng(pin.latitude, pin.longitude);

  map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.SATELLITE,
    disableDoubleClickZoom: true,
    center: currentLocation,
    zoom: 20
  });

  panorama = map.getStreetView();
  panorama.setPosition(currentLocation);
  panorama.setVisible(true);
}




// panorama = map.getStreetView();
//   panorama.setPosition(astorPlace);
//   panorama.setPov({
//     heading: 265,
//     pitch:0}
//   );
// }

// function toggleStreetView() {
//   var toggle = panorama.getVisible();