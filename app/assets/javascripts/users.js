$(document).ready(function(){
  getLocation();
});

function getLocation() {
  var lat = $("#latitude");
  var lng = $("#longitude");
  var options = {
    maximumAge: 0,
    enableHighAccuracy: true
  }

  if (navigator.geolocation) {
    navigator.geolocation.watchPosition(showPosition, null, options);
  }
  else {
    lat.innerHTML = "Geolocation is not supported by this browser.";
    lng.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  lat.html(position.coords.latitude.toFixed(4));
  lng.html(position.coords.longitude.toFixed(4));
  $("#latitudeinput").val(position.coords.latitude);
  $("#longitudeinput").val(position.coords.longitude);
}