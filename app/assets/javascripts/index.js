$(document).ready(function(){
  var $header = $("nav");
  var windowHeight = $(window).height(); 
  console.log(windowHeight);
  $(".section_index").css("height", windowHeight);

  $header.addClass("down");
  
  $(window).scroll(function() {
    if(document.body.scrollTop == 0) {
      $header.addClass("down");
    } else {
      $header.removeClass("down");
    }
  });

  $bgobj = $('#hero');
    
  $(window).scroll(function() {
    var yPos = -($(this).scrollTop() / $bgobj.data('speed'));
    var coords = '50% '+ yPos + 'px';
    $bgobj.css("background-position", coords);
  });   

});