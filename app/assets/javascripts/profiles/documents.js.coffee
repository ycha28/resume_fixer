$(document).ready ->
  $('#preview-modal').on('show.bs.modal', (event) ->
    link = $(event.relatedTarget)
    url = link.data('url')
    title = link.data('title')

    $('#embedded-preview').prop('src', url)
    $('#document-title').text(title)
  )