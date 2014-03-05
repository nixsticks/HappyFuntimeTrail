$(document).ready(function(){
  var $header = $("nav");
  var windowHeight = $(window).height();
  var $bgobjs = [$('#hero'), $('#start')];
  var ratioParxSect = 1.81;
  $bgobjs[1].height(windowHeight/ratioParxSect) 
 
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
    $this = $(this)
    console.log($this.scrollTop())
    
    $.each($bgobjs, function(index, obj) {
      var yPos = -($this.scrollTop() / obj.data('speed'));
      var coords = '50% '+ yPos + 'px';
      obj.css("background-position", coords);
    })    
  });   

});

// $.each([ 52, 97 ], function( index, value ) {
//   alert( index + ": " + value );
// });