$(document).on('page:change', ready);

function ready() {
  var $compass = $(".compass img");
  var $header = $("nav");

  $compass.on("click", function(event) {
    $header.toggleClass("down");
  });
}