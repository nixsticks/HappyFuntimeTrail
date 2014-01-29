$(document).ready(function () { 
  var $compass = $(".compass img")
  var $header = $(".header")

  $compass.toggle(
    function(){
      $header.animate({top: "0px"}, "normal")
    }, 
    function(){
      $header.animate({top: "-60px"}, "normal")
    });
  })
  
  // $compass.click(function (){
  //   $(".header").animate(
  //   {
  //     top: "0px"
  //   }, 
  //   "normal");
  // })

