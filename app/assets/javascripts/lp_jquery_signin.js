// var ready = function(){
$(document).ready(function(event){
  console.log('ready')
  $("#signup").on("click", function(event) {
    // alert("sign up clicked!")
    event.preventDefault();
    console.log('hi')
    $("#signupdiv").toggle("slow", function() {
      console.log('bye')
    // Animation complete.
    });
  });

   $("#signin").on("click", function(event) {
     // alert("sign in clicked!")
      event.preventDefault();
      $("#signindiv").toggle("slow", function() {
    // Animation complete.
    });
  });

}); 

// }

// $(document).ready(ready);
// $(document).on('page:load', ready);