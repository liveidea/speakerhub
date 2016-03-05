# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# This code destroy speech with ajax
$(document).on 'ready page:load', ->
  $('.delete_my_speech').on 'click', ->
    current_item_row = $(this).closest('.row')
    if confirm('Do you really want to destroy this speech?')
      $.ajax
        url: '/speeches/' + $(current_item_row).attr('data-item-id')
        type: 'POST'
        data: _method: 'DELETE'
        success: (result) ->
          $(current_item_row).fadeOut 'slow'
