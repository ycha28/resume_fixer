$(document).ready ->
  $('#preview-modal').on('show.bs.modal', (event) ->
    link = $(event.relatedTarget)
    url = link.data('url')
    title = link.data('title')

    $('#embedded-preview').prop('src', url)
    $('#document-title').text(title)
  )

  $('#info-modal').on('show.bs.modal', (event) ->
    # CLear user and editor comments
    $('#file-name').html('')
    $('#file-type').html('')
    $('#price').html('')
    $('#user-comments').html('')
    $('#editor-comments').html('')

    link = $(event.relatedTarget)
    file_name = link.data('file-name')
    file_type = link.data('file-type')
    price = link.data('price')
    user_comments = link.data('user-comments') || ''
    editor_comments = link.data('editor-comments') || ''

    $('#file-name').html("<p><strong>File name:</strong> #{file_name}</p>")
    $('#file-type').html("<p><strong>File type:</strong> #{file_type}</p>")
    $('#price').html("<p><strong>Price:</strong> $#{price}</p>")

    if user_comments
      $('#user-comments').html("<h5>Your Comments</h5><p>#{user_comments}</p>")
    
    if editor_comments
      $('#editor-comments').html("<h5>Editor Comments</h5><p>#{editor_comments}</p>")
    
    if user_comments == '' and editor_comments == ''
      $('#user-comments').html("<p>No comments available!</p>")
  )

  $('#upload-modal').on('show.bs.modal', (event) ->
    link = $(event.relatedTarget)
    document_id = link.data('document-id')
    $('.change-file-form').prop('action', '/profile/documents/' + document_id)
  )