$(document).ready ->
  $('.email-signup').click ->
    $('.modal.in').modal('hide')
    $('.email-signup-modal').modal('show')

  $('.forgot-password').click ->
    $('.modal.in').modal('hide')
    $('.forgotten-password-modal').modal('show')  