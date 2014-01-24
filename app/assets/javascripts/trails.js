// get pin information from pin-data
var pins = $('.pin-data').data('pins');

var latlngs = [];

var map = new google.maps.Map(document.getElementById('map-canvas'), {mapTypeId: google.maps.MapTypeId.HYBRID});

var infowindow = new google.maps.InfoWindow();

$(document).ready(function(){
  initialize();
});

function initialize() {
  // set down a marker for each pin; bind click event handler to marker
  for (var i = 0, pin; pin = pins[i]; i++) {
    var latlng = new google.maps.LatLng(pin.latitude, pin.longitude);
    latlngs.push(latlng);

    var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      icon: "/assets/number_" + pin.stepnumber + ".png",
      title: 'Treasure Hunt!'
    });

    clickMarker(marker, pin);
  }

  // set up the map with bounds, center, and polyline
  var latlngBounds = new google.maps.LatLngBounds();
  latlngs.forEach(function (n) {
    latlngBounds.extend(n);
  });
  map.setCenter(latlngBounds.getCenter());
  map.fitBounds(latlngBounds); 
  trailPath().setMap(map);
}

function clickMarker(marker, pin) {
  google.maps.event.addListener(marker, 'click', function(event) {
    infowindow.setContent('<p>' + pin.address + '</p>');
    infowindow.open(map, marker);
  });
}

function trailPath() {
  var path = new google.maps.Polyline({
    path: latlngs,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  return path;
}