$(document).on 'page:change', ->
  $('div#conference_show_speeches').on 'click', ->
    $('.btn.btn-info.disabled').fadeOut('slow')
    current_conference = $(this).closest('tr')
    $.ajax
      url: '/conferences/' + $(current_conference).attr('data-item-id') + '/speeches'
      type: "GET"
    $('#abc').fadeToggle('slow')
    $('#paginator').fadeToggle('slow')
