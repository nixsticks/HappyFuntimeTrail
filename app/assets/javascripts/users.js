var lat = $("#latitude");
var lng = $("#longitude");

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.watchPosition(showPosition);
  }
  else {
    container.innerHTML="Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  lat.html(position.coords.latitude);
  lng.html(position.coords.longitude);
}

getLocation();