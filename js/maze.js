$(document).ready(function(){

var win = true;

$("#start").mouseover(function() {
    $("#status").html("Move your mouse over the S to begin");
    $(".boundary").each(function() {
        $(this).mouseover(function(event) {
            win = false;
            $(this).css("background-color", "red");
            
            $("#status").html("YOU LOSE!");
            event.stopPropagation();
          });
    });
     
    $(".boundary").css("background-color", "#eeeeee");
  });

  $("#end").mouseover(function() {
  if (win == true) {
    $("#status").html("YOU WIN!");
    
  }
  win = true;
});
});
