var lat = $("#latitude");
var lng = $("#longitude");

function getLocation() {
  var options = {
    enableHighAccuracy: true
  }

  if (navigator.geolocation) {
    navigator.geolocation.watchPosition(showPosition, null, options);
  }
  else {
    container.innerHTML="Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  lat.html(position.coords.latitude);
  lng.html(position.coords.longitude);
  $("#latitudeinput").val(position.coords.latitude);
  $("#longitudeinput").val(position.coords.longitude);
}

getLocation();