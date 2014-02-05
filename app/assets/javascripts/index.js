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


  
  // $(function() {
  //   $('#slides').slidesjs({
  //     width: 940,
  //     height: 528,
  //     navigation: {
  //       effect: "fade"
  //     },
  //     pagination: {
  //       effect: "fade"
  //     },
  //     effect: {
  //       fade: {
  //         speed: 400
  //       }
  //     }
  //   });
  // });
});