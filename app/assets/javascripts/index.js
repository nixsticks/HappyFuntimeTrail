$(document).ready(function(){
  var $header = $("nav");

  $header.addClass("down");
  $(window).scroll(function() {
    $header.removeClass("down");
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