
jQuery(document).ready(function($) {
  $( "#signup" ).click(function(event) {
  	event.preventDefault();
  $( "#signupdiv" ).toggle( "slow", function() {
    // Animation complete.
  });
});

   $( "#signin" ).click(function(event) {
  	event.preventDefault();
  $( "#signindiv" ).toggle( "slow", function() {
    // Animation complete.
  });
});

}); //document.ready