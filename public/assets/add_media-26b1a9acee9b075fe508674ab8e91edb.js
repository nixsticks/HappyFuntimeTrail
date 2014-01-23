// add_media.js

var pins;
var latlngs = [];
var markers = [];
var infowindow = new google.maps.InfoWindow();
var trailPath;
var map;

$(document).ready(function(){
  initialize();
});

function initialize() {
  map = new google.maps.Map(document.getElementById('map-canvas'), {mapTypeId: google.maps.MapTypeId.HYBRID});

  setPins();

  var latlngBounds = new google.maps.LatLngBounds();
  latlngs.forEach(function (n) {
    latlngBounds.extend(n);
  });
  map.setCenter(latlngBounds.getCenter());
  map.fitBounds(latlngBounds); 

  trail();
}

function clickMarker(marker, pin) {
  google.maps.event.addListener(marker,'click',function(e) {
    infowindow.setContent('<p>' + pin.address + '</p>');
    infowindow.open(map, marker);
  });
}

function setPins() {
  latlngs = [];
  pins = $('.pin-data').data('pins');
  for (var i = 0, pin; pin = pins[i]; i++) {
    var latlng = new google.maps.LatLng(pin.latitude, pin.longitude);
    latlngs.push(latlng);

    var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      icon: "/assets/number_" + pin.stepnumber + ".png",
      title: 'Treasure Hunt!'
    });

    markers.push(marker);
    clickMarker(marker, pin);
  }
}

function trail() {
  if (trailPath) {
    trailPath.setMap(null);
    trailPath = null;
  }

  trailPath = new google.maps.Polyline({
    path: latlngs,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  trailPath.setMap(map);
}
;
