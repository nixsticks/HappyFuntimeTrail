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
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(40.7484, -73.9857),
      new google.maps.LatLng(40.8484, -73.1587));
  map.fitBounds(defaultBounds);

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

    // var all_markers = $('#map_canvas').gmap('get','markers');
    // console.log(all_markers);

    for (var i = 0, marker; marker = markers[i]; i++) {
      google.maps.event.addListener(marker,'click',function(e) {
        var marker = this;
        geocoder.geocode({latLng: this.getPosition()}, function(results) {
          if (results[0]) {
            infowindow.setContent(
              '<p>' + results[0].formatted_address + '</p>' +
              '<button id="setPin">Set Pin</button>'
              )
            infowindow.open(map, marker);
            fillInputs('.address', results[0].formatted_address);
            // $('.address').val(results[0].formatted_address);
          }
          else {
            alert("Sorry, we couldn't determine the address of this location.")
          }
        });
        fillInputs('.lat', this.getPosition().lat());
        fillInputs('.long', this.getPosition().lng());
      });
    }

    map.fitBounds(bounds);
  });

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
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

// google.maps.event.addListener(map,'click',function(event) {
//     geocoder.geocode({latLng: event.latLng}, function(responses) {
//       if (responses && responses.length > 0) {
//         var infowindow = new google.maps.InfoWindow({content: '<p>hi</p>'})
//         infowindow.open(map, event)
//       }
//       else {
//         alert("Sorry, we couldn't determine the address of this location.")
//       }
//     });
//     document.getElementById('lat').value = event.latLng.lat();
//     document.getElementById('long').value = event.latLng.lng();
//   });

google.maps.event.addDomListener(window, 'load', initialize);

$(document).on("click", "#setPin", function(event){
  alert("Pin set.");
});

$(document).ready(function(){
  $("#more").click(function() {
    number = "[" + $('.pingroup').size(); + "]"
    $(".pins").append(["<div class='pingroup'><input class='lat' name='pins_attributes", number, "[latitude]'", "type='text'><input class='long' name='pins_attributes", number, "[longitude]'", "type='text'><input class='address' name='pins_attributes", number, "[address]'", "type='text'></div>"].join(""));
  });  
});