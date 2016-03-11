ready
ready = ->

  $('.slider').hide()

  $('a').click ->
    form = this.getAttribute('data-slider-content')

    if $(form).is(":visible")
      $(form).slideUp(350)
    else
      $(form).slideDown(350)

  $(document).bind "ajaxError", "form.ajax_form", (event, jqxhr, settings, exception) ->
    error_list = document.getElementById('errors')
    while error_list.firstChild
      error_list.removeChild error_list.firstChild

    $ajax_form = $(event.data)

    $error_container = $("#error_explanation", $ajax_form)
    $error_container_ul = $("ul#errors", $error_container)

    $error_container.show()  if $error_container.is(":hidden")

    $.each jqxhr.responseJSON, (index, message) ->
      $("<li class='error-message'>").html(message).appendTo $error_container_ul

$(document).ready ready
$(document).on "page:load", ready
