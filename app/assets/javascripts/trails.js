var pins = $('.pin-data').data('pins');
var latlngs = [];
console.log(pins);

function initialize() {
  var map = new google.maps.Map(document.getElementById('map-canvas'));
  var infowindow = new google.maps.InfoWindow();

  for (var i = 0, pin; pin = pins[i]; i++) {
    var latlng = new google.maps.LatLng(pin.latitude, pin.longitude);
    latlngs.push(latlng);

    var marker = new google.maps.Marker({
      position: latlng,
      map: map,
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

  function clickMarker(marker, pin) {
    google.maps.event.addListener(marker,'click',function(e) {
      currentMarker = marker;
      infowindow.setContent('<p>' + pin.address + '</p>');
      infowindow.open(map, marker);
    });
  }
}

google.maps.event.addDomListener(window, 'load', initialize);