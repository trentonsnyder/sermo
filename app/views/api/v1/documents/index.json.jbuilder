json.documents @documents.each do |d|
  json.id d.id
  json.client_id d.client_id
  json.name d.name
  json.url d.url
  json.extension d.extension
end