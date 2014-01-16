$('#pins').sortable(
  {
    update: function() {
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
      $.get($('.dynamic').data('update-url'), function( data ) {
        $(".dynamic").html(data);
      });
    }
  }
);

var pins = $('.pin-data').data('pins');
console.log(pins);
var latlngs = [];
var markers = [];
var infowindow = new google.maps.InfoWindow();
var trailPath;

function initialize() {
  var map = new google.maps.Map(document.getElementById('map-canvas'));

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

  trailPath = new google.maps.Polyline({
    path: latlngs,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 1
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

google.maps.event.addDomListener(window, 'load', initialize);