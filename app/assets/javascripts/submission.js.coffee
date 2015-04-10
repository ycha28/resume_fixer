$(document).ready ->
  $('#add_cover_letter').on('click', (event) ->
    event.preventDefault()
    id = $('#cover_letters').children().length
    $('#cover_letters').append("<input id='submission_cover_letter_attributes_#{id}' name='submission[cover_letter_attributes][#{id}]' type='file'>")

    $("#submission_cover_letter_attributes_#{id}").one('change', ->
      newTotalCost = parseInt($('#total_price').text()) + 15
      $('#total_price').text(newTotalCost)
      $('#submission_amount').val(newTotalCost)
    )
  )

  $('#add_resume').on('click', (event) ->
    event.preventDefault()
    id = $('#resumes').children().length
    $('#resumes').append("<input id='submission_resume_attributes_#{id}' name='submission[resume_attributes][#{id}]' type='file'>")

    $("#submission_resume_attributes_#{id}").one('change', ->
      newTotalCost = parseInt($('#total_price').text()) + 10
      $('#total_price').text(newTotalCost)
      $('#submission_amount').val(newTotalCost)
    )
  )

  $('#add_essay').on('click', (event) ->
    event.preventDefault()
    id = $('#essay').children().length
    $('#essays').append("<input id='submission_essay_attributes_#{id}' name='submission[essay_attributes][#{id}]' type='file'>")

    $("#submission_essay_attributes_#{id}").one('change', ->
      newTotalCost = parseInt($('#total_price').text()) + 5
      $('#total_price').text(newTotalCost)
      $('#submission_amount').val(newTotalCost)
    )
  )

  $('#submission_cover_letter_attributes_0').one('change', ->
    newTotalCost = parseInt($('#total_price').text()) + 15
    $('#total_price').text(newTotalCost)
    $('#submission_amount').val(newTotalCost)
  )

  $('#submission_resume_attributes_0').one('change', ->
    newTotalCost = parseInt($('#total_price').text()) + 10
    $('#total_price').text(newTotalCost)
    $('#submission_amount').val(newTotalCost)
  )

  $('#submission_essay_attributes_0').one('change', ->
    newTotalCost = parseInt($('#total_price').text()) + 5
    $('#total_price').text(newTotalCost)
    $('#submission_amount').val(newTotalCost)
  )