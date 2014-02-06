$(document).ready(function(){
  var $header = $("nav");
  var windowHeight = $(window).height();
  var $bgobj = $('#hero');
 
  console.log(windowHeight);
  $(".section_index").css("height", windowHeight);

  $header.addClass("down");
  
  $(window).scroll(function() {  //for header at top of page
    if(document.body.scrollTop == 0) {
      $header.addClass("down");
    } else {
      $header.removeClass("down");
    }
  });

  $(window).scroll(function() {   //for parallax effect on hero
    var yPos = -($(this).scrollTop() / $bgobj.data('speed'));
    var coords = '50% '+ yPos + 'px';
    $bgobj.css("background-position", coords);
  });   

});