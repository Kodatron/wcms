$(document).ready(function() {
  
  $('.slider').hide(); //Initially elements with class: slider wil be hidden.

  $('a').click(function() {
    form = this.getAttribute('data-slider-content');
    if($(form).is(":visible"))
      $(form).slideUp(350)
    else
      $(form).slideDown(350);//Form shows on button click
   });
 });
