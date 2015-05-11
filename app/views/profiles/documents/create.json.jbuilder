json.document do
  json.id @document.id
  json.type @document.type
  json.content_type @document.content_type
  json.original_filename @document.original_filename
  json.created_at @document.created_at.strftime("%m/%d/%y at%l:%M %P")
end