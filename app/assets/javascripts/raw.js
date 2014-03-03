// get pin information from pin-data
var pins = $('.pin-data').data('pins');
var layer = "watercolor";

var latlngs = [];



var mapOptions = {
  mapTypeId: layer,
  mapTypeControlOptions: {
        mapTypeIds: [layer]
    },
  disableDefaultUI: true
}

var map = new google.maps.Map(document.getElementById('raw-container'), mapOptions);
map.mapTypes.set(layer, new google.maps.StamenMapType(layer));

var infowindow = new google.maps.InfoWindow();

initialize(); //not in docready because i want it to load while page is loading

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