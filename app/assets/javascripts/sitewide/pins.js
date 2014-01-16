// # user sees a map
// # user types in a search 
// # the search drops a marker
// # when the user clicks anywhere else a new marker pops up and that marker disappears
// # when the user clicks the marker an infowindow pops up
// # when the user clicks the "add" button in the infowindow a new pin gets created
// # that marker remains on the map but you can no longer click it

function initialize() {
  var geocoder = new google.maps.Geocoder();
  var infowindow = new google.maps.InfoWindow();
  var markers = [];
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    disableDoubleClickZoom: true,
    center: new google.maps.LatLng(40.7484, -73.9857),
    zoom: 15
  });
  var newMarker;
  var currentMarker;
  var address;

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
     initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
     map.setCenter(initialLocation);
   });
 }

  // Create the search box and link it to the UI element.
  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pin'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));

  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    // For each place, get the icon, place name, and location.
    markers = [];
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      var marker = new google.maps.Marker({
        map: map,
        icon: image,
        title: place.name,
        position: place.geometry.location
      });

      markers.push(marker);

      bounds.extend(place.geometry.location);
    }

    for (var i = 0, marker; marker = markers[i]; i++) {
      clickMarker(marker);
    }

    map.fitBounds(bounds);
  });

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
  });

  google.maps.event.addListener(map,'dblclick',function(event) {
    geocoder.geocode({latLng: event.latLng}, function(results) {

      if(newMarker) {
        newMarker.setMap(null);
      }

      newMarker = new google.maps.Marker({
        position: event.latLng,
        map: map,
        title: results[0].formatted_address
      });

      clickMarker(newMarker);
    });
  });

  function clickMarker(marker) {
    google.maps.event.addListener(marker,'click',function(e) {
      currentMarker = marker;
      geocoder.geocode({latLng: this.getPosition()}, function(results) {
        if (results[0]) {
          address = results[0].formatted_address;
          infowindow.setContent(
            '<p>' + address + '</p>' +
            '<button id="setPin">Set Pin</button>'
            );
          infowindow.open(map, marker);
        }
        else {
          alert("Sorry, we couldn't determine the address of this location.")
        }
      });
    });
  };

  $(document).on("click", "#setPin", function(event){
    fillInputs('.address', address);
    fillInputs('.lat', currentMarker.getPosition().lat());
    fillInputs('.long', currentMarker.getPosition().lng());
  });
}

function fillInputs(classname, content) {
  $(classname).each(function() {
    if (this.value == '') {
      $(this).val(content);
      return false;
    }
  });
}


google.maps.event.addDomListener(window, 'load', initialize);