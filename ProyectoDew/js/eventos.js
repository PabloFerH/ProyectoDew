$(document).ready(function(){
  // Add smooth scrolling to all links
  $("a").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 1000, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
    
 $("#reservas").on("click", function(){
       $(this).menuReserva();
 });
    
  $().loopBotonInicio();
  $().loopReserva();
  $().fechas();
  $().idiomaSlide();
  $().cambiarIdioma();

});

$.fn.cambiarIdioma = function(vent){
    var icon = $("#iconoIdioma");
    $("ul").children("li").children("a").on("click", function(){
        $("#menu1").text(event.currentTarget.text);
        $("#menu1").append(icon);
        $("#opcionesIdioma").slideToggle(); 
    })
}


$.fn.idiomaSlide = function(){
    $("#menu1").on("click",function(){
       $("#opcionesIdioma").slideToggle(); 
    });
}

$.fn.fechas = function(){
  $(".fechas").timepicker({ 'timeFormat': 'H:i' });
  $(".fechas").keydown(function(event) { 
    return false;
});
}

$.fn.loopBotonInicio = function(){

    function loop(){
     $('#flecha')
     .animate({color:'rgba(255,255,255,0.1)'},1000)
     .animate({color:'rgba(255,255,255,1)'},1000,loop);

    }
    
    loop();

	
}

$.fn.loopReserva = function(){
  
  function loop(){
  if($(".aside").hasClass("col-md-1")){
   $('#reservas')
   .animate({color:'rgba(255,255,255,0.4)'},1000)
   .animate({color:'rgba(255,255,255,1)'},1000,loop);
  }else if($(".aside").hasClass("col-md-3")){
    $('#reservas')
   .animate({color:'rgba(255,255,255,1)'},1000,loop);
  }
  }
  
  loop();

}

$.fn.menuReserva = function () {


	if($(".contenedor").hasClass("col-md-11")){
        $(".contenedor").toggleClass("col-md-9",250).toggleClass("col-md-11",250);       
        $(".aside").toggleClass("col-md-3",250).toggleClass("col-md-1",250);
        if(!($(document).width() <= 991)){
            $("#reservas").css({
            transition: "transform 0.8s",
            transform: "rotate(0deg)"});
            
            
        }else{
            $("#inicio").css({
                transition: "height 0.8s",
                height: "620px"});
        }
        
     $("form").css({
            transition: "transform 0.8s",
            transform:"translate(0px)"}); 
    }else{	
        $(".contenedor").toggleClass("col-md-11",250).toggleClass("col-md-9",250);
        
        $(".aside").toggleClass("col-md-1",250).toggleClass("col-md-3",250);
        if(!($(document).width() <= 991)){
        $("#reservas").css({
            transition: "transform 0.8s",
            transform: "rotate(-90deg) translate(-100px)"});
        }else{
            $("#inicio").css({
                transition: "height 0.8s",
                height: "100px"});
        }
        
        $("form").css({
            transition: "transform 0.8s",
            transform:"translate(-850px)"});
    }
    

    
};


$.fn.desactivarBoton = function(){
    
    $("#reservas").off("click", function(){
       $(this).menuReserva();
 });
    
    $().activarBoton();
    
}

$.fn.activarBoton = function(){
    $("#reservas").delay(800).on("click", function(){
       $(this).menuReserva();
 });
}




