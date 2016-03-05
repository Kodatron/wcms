// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//require "http://code.jquery.com/ui/1.9.1/jquery-ui.js"
$( document ).ready(function() {
  $('.modal-trigger').leanModal();
  $(".button-collapse").sideNav();
  $('select').material_select();
  $('.dropdown-button').dropdown({
     inDuration: 300,
     outDuration: 225,
     constrain_width: true,
     hover: true,
     gutter: 0,
     belowOrigin: true,
     alignment: 'left'
   });

  $('.datepicker').pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 15 // Creates a dropdown of 15 years to control year
  });
    $('.custom-tabs .tab-links a').on('click', function(e)  {
        var currentAttrValue = jQuery(this).attr('href');

        $('.custom-tabs ' + currentAttrValue).show().siblings().hide();

        /*jQuery(this).addClass('active').siblings('li a').removeClass('active');*/
        /*Fungerar bättre */
        $('ul.admin-collection.tab-links').find('.active').removeClass('active');
        $(this).addClass('active');

        e.preventDefault();
    });
});
