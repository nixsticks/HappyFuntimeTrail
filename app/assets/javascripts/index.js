$(document).ready(function(){
  var $header = $("nav");
  var windowHeight = $(window).height();
  var $bgobjs = [$('#hero')];
  var ratioParxSect = 1.81;
  // $bgobjs[1].height(windowHeight/ratioParxSect) 
 
  $(".tutorial-pic").fancybox({
    'transitionIn'  : 'elastic',
    'transitionOut' : 'elastic',
    'speedIn'   : 600, 
    'speedOut'    : 200, 
    'hideOnContentClick' : false
  });

  console.log(windowHeight);
  $(".section_index").not("#start").css("height", windowHeight);

  $header.addClass("down");
  
  $(window).scroll(function() {  //for header at top of page
    if(document.body.scrollTop == 0) {
      $header.addClass("down");
    } else {
      $header.removeClass("down");
    }
  });
  
  $(window).on("resize", function(){
    if ($(this).width() < 980) {
      $("#sample_trails").hide();
    } else {
      $("sample_trails").show();
    }
  })

  //for parallax effect on hero
  $(window).scroll(function() {
    $windowObj = $(this)    
    $.each($bgobjs, function(index, obj) {
      if (checkIfInView(obj)) {
        var yPos = -($windowObj.scrollTop() / obj.data('speed'));
        var coords = '50% '+ yPos + 'px';
        obj.css("background-position", coords);
      } else if (checkIfInView(obj)) {
        console.log("HELLO")
        console.log(obj.css("background-position"));
        var yPos = -($windowObj.scrollTop() - obj.offset().top / obj.data('speed'));
        var coords = '50% '+ yPos + 'px';
        obj.css("background-position", coords);
      }
    })    
  });

  function checkIfInView(element){
    var offset = element.offset().top - $(window).scrollTop();
    console.log(offset);

    if(offset > window.innerHeight){
        // Not in view
        return false;
    }
   return true;
  } 

});

// $.each([ 52, 97 ], function( index, value ) {
//   alert( index + ": " + value );
// });