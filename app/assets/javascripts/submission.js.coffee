$(document).ready ->
  $('.submission_file').fileinput({'showUpload': false, 'allowedFileTypes': ['text', 'doc', 'pdf'], 'maxFileCount': 5})

  $('.submission_file').on('fileloaded', (event, file) ->
    cover_letters_cost = $('#cover_letters .file-preview-frame').length * 15
    resumes_cost = $('#resumes .file-preview-frame').length * 10
    essays_cost = $('#essays .file-preview-frame').length * 5
    $('#total_price').text(cover_letters_cost + resumes_cost + essays_cost)
  )