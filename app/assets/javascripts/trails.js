var pins = $('.pin-data').data('pins');
var latlngs = [];

$(document).ready(function(){
  initialize();
});

function initialize() {
  var map = new google.maps.Map(document.getElementById('map-canvas'), {mapTypeId: google.maps.MapTypeId.HYBRID});
  var infowindow = new google.maps.InfoWindow();

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

  var latlngBounds = new google.maps.LatLngBounds();
  latlngs.forEach(function (n) {
    latlngBounds.extend(n);
  });
  map.setCenter(latlngBounds.getCenter());
  map.fitBounds(latlngBounds); 

  var trailPath = new google.maps.Polyline({
    path: latlngs,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  trailPath.setMap(map);

  function clickMarker(marker, pin) {
    google.maps.event.addListener(marker,'click',function(e) {
      currentMarker = marker;
      infowindow.setContent('<p>' + pin.address + '</p>');
      infowindow.open(map, marker);
    });
  }
}