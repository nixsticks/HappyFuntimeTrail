$(document).ready(function () { 
  var $compass = $(".compass img");
  var $header = $(".header");

  $compass.toggle(
    function(event){
      $header.animate({top: "0px"}, "normal");
      event.preventDefault();
    },
    function(event){
      $header.animate({top: "-60px"}, "normal");
      event.preventDefault();
    });

    
   
    

  // $compass.click(function (){
  //   $(".header").animate(
  //   {
  //     top: "0px"
  //   }, 
  //   "normal");
  // })
});
  
  

