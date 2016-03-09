ready
ready = ->
  $('.slider').hide()

  $('a').click ->
    form = this.getAttribute('data-slider-content')

    if $(form).is(":visible")
      $(form).slideUp(350)
    else
      $(form).slideDown(350)

$(document).ready ready
$(document).on "page:load", ready
