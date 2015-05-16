$(document).ready ->
  $('#preview-modal').on('show.bs.modal', (event) ->
    link = $(event.relatedTarget)
    url = link.data('url')
    title = link.data('title')

    $('#embedded-preview').prop('src', url)
    $('#document-title').text(title)
  )

  $('#comments-modal').on('show.bs.modal', (event) ->
    # CLear user and editor comments
    $('#user-comments').html('')
    $('#editor-comments').html('')

    link = $(event.relatedTarget)
    user_comments = link.data('user-comments') || ''
    editor_comments = link.data('editor-comments') || ''

    if user_comments
      $('#user-comments').html("<h5>Your Comments</h5><p>#{user_comments}</p>")
    
    if editor_comments
      $('#editor-comments').html("<h5>Editor Comments</h5><p>#{editor_comments}</p>")
    
    if user_comments == '' and editor_comments == ''
      $('#user-comments').html("<p>No comments available!</p>")
  )