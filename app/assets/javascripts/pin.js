$(document).ready(function(){
  initialize();
  bindAjax();
});

function initialize() {
  var pin = $('.pin-data').data('pin');
  var currentLocation = new google.maps.LatLng(pin.latitude, pin.longitude);
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.HYBRID,
    center: currentLocation,
    zoom: 20
  });

  panorama = map.getStreetView();
  panorama.setPosition(currentLocation);
  panorama.setVisible(true);
}

function bindAjax() {
  var $forms = $("form");
  console.log($forms);
  $forms.on("ajax:success", function(e, data, status, xhr) {
    var $this = $(this);

    $this.parent().children().each(function() {
      console.log($(this));
      $(this).remove();
    });
  }).bind("ajax:error", function(e, xhr, status, error) {
    $(this).append("<h3>" + error + "</h3>");
  });
}