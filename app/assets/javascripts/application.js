// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs

//= require bootstrap-sprockets
//= require bootstrap/bootstrap

//= 'require_self'
//= require_tree .
//= require turbolinks


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
