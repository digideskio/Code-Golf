// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// = require jquery
// = require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $(".link").click(function() {
    window.location=$(this).find("a").attr("href");
    return false;
  });
  $(".link")
    .mouseenter(function() {
      $(this).addClass("main_border");
    })
    .mouseleave(function() {
      $(this).removeClass("main_border");
  })
});
