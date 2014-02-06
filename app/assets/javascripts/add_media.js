var pins = $('.pin-data').data('pins');
var latlngs = [];
var markers = [];
var infowindow = new google.maps.InfoWindow();
var trailPath;
var map;

$(document).ready(function(){
  initialize();
  slidePanels();
  bindAjax();
});

function initialize() {
  map = new google.maps.Map(document.getElementById('map-canvas'), {mapTypeId: google.maps.MapTypeId.HYBRID});

  setPins();

  //set up map with bounds, center, and polyline
  var latlngBounds = new google.maps.LatLngBounds();
  latlngs.forEach(function (n) {
    latlngBounds.extend(n);
  });
  map.setCenter(latlngBounds.getCenter());
  map.fitBounds(latlngBounds); 
  trailPath().setMap(map);
}

function setPins() {
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

function clickMarker(marker, pin) {
  google.maps.event.addListener(marker,'click',function(e) {
    infowindow.setContent('<p>' + pin.address + '</p>');
    infowindow.open(map, marker);
  });
}

function trailPath() {
  path = new google.maps.Polyline({
    path: latlngs,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  return path;
}

function slidePanels() {
  $("ol.panels > li").click(function(event) {
    event.preventDefault();
    var target = $(this).attr("class");
    $('#' + target).slideToggle();
  });
}

function bindAjax() {
  var $forms = $(".edit_pin");
  $forms.on("ajax:success", function(e, data, status, xhr) {
    var $this = $(this);

    $this.find(":input").each(function(){
      if (this.type === "file") {
        $(this).replaceWith($(this).val("").clone(true));
      } else if (this.type!== "hidden" && this.type !== "submit") {
        $(this).val("");
      }
    });

    $this.append("<h3 id='remove'>Success!</h3>");

    setTimeout(function() {
      $("#remove").fadeOut("slow", function() {
        $(this).remove();
      });
    }, 5000);

  }).bind("ajax:error", function(e, xhr, status, error) {
    $(this).append("<h3>" + error + "</h3>");
  });
}