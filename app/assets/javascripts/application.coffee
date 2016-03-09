# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .
#require "http://code.jquery.com/ui/1.9.1/jquery-ui.js"

ready
ready = ->
  $(".button-collapse").sideNav()
  $('.dropdown-button').dropdown({
     inDuration: 300,
     outDuration: 225,
     constrain_width: true,
     hover: true,
     gutter: 0,
     belowOrigin: true,
     alignment: 'left'
   })

  $('.datepicker').pickadate({
      selectMonths: true,
      selectYears: 5
  })

  $('select').material_select()

$(document).ready ready
$(document).on "page:load", ready
