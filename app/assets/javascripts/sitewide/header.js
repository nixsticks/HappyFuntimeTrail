// header.js

$(document).on('page:change', ready);

function ready() {
  var $compass = $(".compass img");
  var $header = $("nav");

  setTimeout(function(){
    $header.removeClass("down");
  }, 2000);

  $compass.on("click", function(event) {
    $header.toggleClass("down");
  });
}