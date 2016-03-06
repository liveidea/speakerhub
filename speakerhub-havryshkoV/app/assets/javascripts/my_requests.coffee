$(document).on 'page:change', ->
  $('a#popup').click ->
    $(this).closest('tr').find('#abc').fadeToggle 'slow'
    return
  $('img#close').click ->
    $(this).closest('tr').find('#abc').fadeOut 'slow'
    return
